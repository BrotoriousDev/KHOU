desc "use Nokogiri to fetch HTML obs"
task :fetch_obs => :environment do
# first we have to parse the document. I will store the table in 'table' and then reverse the table
  require 'open-uri'
  doc = Nokogiri::HTML(open('http://www.weather.gov/data/obhistory/KHOU.html'))
  table = doc.xpath('//table[4]//tr//td')
  reverse_table = table.reverse

  # now we have a reversed table( which will make writing obs easier so we go from oldest to newest)
  # we have to write a little hack to make sure the dates are correct. The only info in the table is
  # the 'day number'. We can also get the current time info by calling Time.now. Knowing this info,
  # we have to be able to compare the data in the html table with the data in the database and conclude
  # weather or not the current row of data in the HTML table should be written to the table.
  t = Time.now
  daynums = table.each_slice(18).map do |slice|
    slice[0].text.to_i
  end
  daynums = daynums.uniq
  @newmonthflag = (daynums.any? {|n| n>25} && daynums.any? {|n| n<3})
  # now i will write a loop that actually writes the obs. in the first case ( table is empty) we only write
  # a single ovservation. otherwise, we write all of the obs currently not in the data table.

  if !Observation.any?
    # here is the code to select the correct month
    if (@newmonthflag) && reverse_table[17].text.to_i > 25
      month = t.month - 1
    else
      month = t.month
    end
    # and now to select the correct year
    if t.month==1 && month==12
      year = t.year - 1
    else
      year = t.year
    end
    #puts 'inside the !observation.any? if clause'
    day = reverse_table[17].text
    date = year.to_s<<'-'<<month.to_s<<'-'<<day.to_s
    time = reverse_table[16].text
    dt_string = date<<' '<<time
    datetime = Time.parse(dt_string).to_datetime.utc
    windspeed = reverse_table[15].text[/\d+/].to_i
    tmp = reverse_table[11].text.to_i
    dwpt = reverse_table[10].text.to_i
    Observation.create(datetime:datetime,temperature:tmp,dewpoint:dwpt,windspeed:windspeed)
  else
    timedata = Observation.last.datetime.to_time.to_s.scan(/\d+/)
    newestDBob_integer = timedata[0]<<timedata[1]<<timedata[2]<<timedata[3]<<timedata[4]
    newestDBob_integer = newestDBob_integer.to_i
    puts newestDBob_integer
    reverse_table.each_slice(18) do |slice|
      if (@newmonthflag) && slice[17].text.to_i > 25
        month = t.month - 1
      else
        month = t.month
      end
      # and now to select the correct year
      if t.month==1 && month==12
        year = t.year - 1
      else
        year = t.year
      end
      day = slice[17].text
      time = slice[16].text
      date = year.to_s<<'-'<<month.to_s<<'-'<<day.to_s
      dt_string = date<<' '<<time
      datetime = Time.parse(dt_string).to_datetime.utc
      windspeed = slice[15].text[/\d+/].to_i
      tmp = slice[11].text.to_i
      dwpt = slice[10].text.to_i
      htmltimedata = datetime.to_time.to_s.scan(/\d+/)
      htmlOB_integer = htmltimedata[0]<<htmltimedata[1]<<htmltimedata[2]<<htmltimedata[3]<<htmltimedata[4]
      htmlOB_integer = htmlOB_integer.to_i
      puts htmlOB_integer
      if htmlOB_integer>newestDBob_integer
        Observation.create(datetime:datetime,temperature:tmp,dewpoint:dwpt,windspeed:windspeed)
      end
    end
  end # end the ' if !Observation.any? loop
end # end task