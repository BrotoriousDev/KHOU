class ObservationsController < ApplicationController

def forecast_verification
  #this is going to be an awfully big god-like thing, but lets crank it out.
  #ALGORITHM-
  #   (1) get user input
  #   (2) HUGE ASS SWITCH STATEMENT
  #       -if userinput=temperature
  #          a) declare 6 arrays, 2 for each forecast [wxvar,time]
  #          b) build an array of strings corresponding to the name
  #              of each 'column' in the database. The columns are
  #              named like 't_24,t_36,t_48,t_60...t_180,t_192'
  #          c) do a loop over the array created in b)
  #              (1)get temp value from database
  #              (2)push the value temp onto array built in (a)
  #              (3) do the step (1)and(2) for the time values
  #          d) next we have to make the JSON arrays, we will loop over
  #              the arrays built in the previous step like this
  #        -Now repeat these steps for the dewpoint and windspeed arrays
  #

userdate = params[:userdate].to_s
wxvar = params[:field].to_s
@wxvar_name = wxvar.capitalize
if userdate.nil?
 userdate = ''
else
  #first step is pulling observations out of database
  userdatetime = userdate<<' 11:53:00.000000'
  firstid = Observation.where(:datetime=>userdatetime).pluck(:id)
  ob_ids = (firstid[0].to_i..firstid[0].to_i+192).to_a
  obs = Observation.where(id: ob_ids)

  case wxvar
    when "temperature"
      @gfsxtemps = Array.new
      @gfsxtimes = Array.new
      @namtemps = Array.new
      @namtimes = Array.new
      @gfstemps = Array.new
      @gfstimes = Array.new

      gfsxtimearray = 24.step(192,12).to_a.map {|n| 't_'<<n.to_s}
      namtimearray = 18.step(78,3).to_a.map {|n| 't_'<<n.to_s}
      gfstimearray = 18.step(78,3).to_a.map {|n| 't_'<<n.to_s}
      gfsxtimearray.each do |t|
        temp  = GfsxTemperature.where(:startdate=>userdate.to_date).pluck(t.to_sym).first
        @gfsxtemps.push(temp)
        time = GfsxTime.where(:startdate=>userdate.to_date).pluck(t.to_sym).first
        @gfsxtimes.push(time)
      end

      namtimearray.each do |t|
        temp = NamTemperature.where(:startdate=>userdate.to_date).pluck(t.to_sym).first
        @namtemps.push(temp)
        time = NamTime.where(:startdate=>userdate.to_date).pluck(t.to_sym).first
        @namtimes.push(time)
      end

      gfstimearray.each do |t|
        temp = GfsTemperature.where(:startdate=>userdate.to_date).pluck(t.to_sym).first
        @gfstemps.push(temp)
        time = GfsTime.where(:startdate=>userdate.to_date).pluck(t.to_sym).first
        @gfstimes.push(time)
      end

      @gfsxforecast = (0..@gfsxtemps.length-1).map do |n|
	      [@gfsxtimes[n].to_i*1000,@gfsxtemps[n]]
      end

      @namforecast = (0..@namtemps.length-1).map do |n|
      	[@namtimes[n].to_i*1000,@namtemps[n]]
      end

      @gfsforecast = (0..@gfstemps.length-1).map do |n|
      	[@gfstimes[n].to_i*1000,@gfstemps[n]]
      end

      @ob_array = obs.map do |ob|
        [ob.datetime.to_i*1000,ob.temperature]
      end

    when "dewpoint"
      @gfsxdewpoints = Array.new
      @gfsxtimes = Array.new
      @namdewpoints = Array.new
      @namtimes = Array.new
      @gfsdewpoints = Array.new
      @gfstimes = Array.new

      gfsxtimearray = 24.step(192,12).to_a.map {|n| 't_'<<n.to_s}
      namtimearray = 18.step(78,3).to_a.map {|n| 't_'<<n.to_s}
      gfstimearray = 18.step(78,3).to_a.map {|n| 't_'<<n.to_s}

      gfsxtimearray.each do |time|
        dewpoint = GfsxDewpoint.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @gfsxdewpoints.push(dewpoint)
        time = GfsxTime.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @gfsxtimes.push(time)
      end

      namtimearray.each do |time|
        dewpoint = NamDewpoint.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @namdewpoints.push(dewpoint)
        time = NamTime.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @namtimes.push(time)
      end

      gfstimearray.each do |time|
        dewpoint = GfsDewpoint.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @gfsdewpoints.push(dewpoint)
        time = GfsTime.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @gfstimes.push(time)
      end

      @gfsxforecast = (0..@gfsxdewpoints.length-1).map do |n|
      	[@gfsxtimes[n].to_i*1000,@gfsxdewpoints[n]]
      end

      @namforecast = (0..@namdewpoints.length-1).map do |n|
       	[@namtimes[n].to_i*1000,@namdewpoints[n]]
      end

      @gfsforecast = (0..@gfsdewpoints.length-1).map do |n|
	      [@gfstimes[n].to_i*1000,@gfsdewpoints[n]]
      end

      @ob_array = obs.map do |ob|
        [ob.datetime.to_i*1000,ob.dewpoint]
      end

    when "windspeed"
      @gfsxwindspeeds = Array.new
      @gfsxtimes = Array.new
      @namwindspeeds = Array.new
      @namtimes = Array.new
      @gfswindspeeds = Array.new
      @gfstimes = Array.new

      gfsxtimearray = 24.step(192,12).to_a.map {|n| 't_'<<n.to_s}
      namtimearray = 18.step(78,3).to_a.map {|n| 't_'<<n.to_s}
      gfstimearray = 18.step(78,3).to_a.map {|n| 't_'<<n.to_s}

      gfsxtimearray.each do |time|
        windspeed = GfsxWind.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @gfsxwindspeeds.push(windspeed)
        time = GfsxTime.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @gfsxtimes.push(time)
      end

      namtimearray.each do |time|
        windspeed = NamWind.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @namwindspeeds.push(windspeed)
        time = NamTime.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @namtimes.push(time)
      end

      gfstimearray.each do |time|
        windspeed = GfsWind.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @gfswindspeeds.push(windspeed)
        time = GfsTime.where(:startdate=>userdate.to_date).pluck(time.to_sym).first
        @gfstimes.push(time)
      end

      @gfsxforecast = (0..@gfsxwindspeeds.length-1).map do |n|
	      [@gfsxtimes[n].to_i*1000,@gfsxwindspeeds[n]]
      end

      @namforecast = (0..@namwindspeeds.length-1).map do |n|
      	[@namtimes[n].to_i*1000,@namwindspeeds[n]]
      end

      @gfsforecast = (0..@gfswindspeeds.length-1).map do |n|
      	[@gfstimes[n].to_i*1000,@gfswindspeeds[n]]
      end

      @ob_array = obs.map do |ob|
        [ob.datetime.to_i*1000,ob.windspeed]
      end

    end

end
@titlestring = userdate[0..9]<<' KHOU '<<@wxvar_name<<' Forecast Verification'
end
end
