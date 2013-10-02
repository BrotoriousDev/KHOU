desc "get GFSX MOS 192hr forecast data"
task "fetch_GFSX"  => "environment" do
  #2013-09-01 update: parse doc, get 'linearray' which is all the data in a
  #table-like format, dt_info is array with strings corresponding to daynumber
  #monthnumber,year,hour. Get a Time object called startdate from dt_info, then
  #.scan function to parse string for all integer values. Then we have to create
  # the future forecast times because we only have the start date and hour.
  require 'open-uri'
  doc = Nokogiri.HTML(open('http://www.nws.noaa.gov/cgi-bin/mos/getmex.pl?sta=KHOU'))
  linearray = doc.xpath('//pre').to_s.lines("\n").to_a
  dt_info = linearray[1].scan(/\d+/)
  dt_info[3] = dt_info[3][0..1]
  startdate = Time.utc(dt_info[2],dt_info[0],dt_info[1],dt_info[3]).to_date
  t = linearray[5].scan(/\d+/)
  d = linearray[6].scan(/\d+/)
  w = linearray[7].scan(/\d+/)
  starthour = dt_info[3].to_i
  newdates = (starthour+12).step(starthour+180,12).to_a.map do |step|
    startdate + 12.hours + step.hours
  end

    GfsxTime.create(startdate:startdate,t_24:newdates[0],t_36:newdates[1],t_48:newdates[2]  \
,t_60:newdates[3],t_72:newdates[4],t_84:newdates[5],t_96:newdates[6],t_108:newdates[7]  \
,t_120:newdates[8],t_132:newdates[9],t_144:newdates[10],t_156:newdates[11] \
,t_168:newdates[12],t_180:newdates[13],t_192:newdates[14])

    GfsxTemperature.create(startdate:startdate,t_24:t[0],t_36:t[1],t_48:t[2]  \
,t_60:t[3],t_72:t[4],t_84:t[5],t_96:t[6],t_108:t[7]  \
,t_120:t[8],t_132:t[9],t_144:t[10],t_156:t[11] \
,t_168:t[12],t_180:t[13],t_192:t[14])

    GfsxDewpoint.create(startdate:startdate,t_24:d[0],t_36:d[1],t_48:d[2]  \
,t_60:d[3],t_72:d[4],t_84:d[5],t_96:d[6],t_108:d[7]  \
,t_120:d[8],t_132:d[9],t_144:d[10],t_156:d[11] \
,t_168:d[12],t_180:d[13],t_192:d[14])

    GfsxWind.create(startdate:startdate,t_24:w[0],t_36:w[1],t_48:w[2]  \
,t_60:w[3],t_72:w[4],t_84:w[5],t_96:w[6],t_108:w[7]  \
,t_120:w[8],t_132:w[9],t_144:w[10],t_156:w[11] \
,t_168:w[12],t_180:w[13],t_192:w[14])

end
