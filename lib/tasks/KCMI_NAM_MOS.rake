desc "get NAM MOS 84hr forecast data"
task "fetch_NAM"  => "environment" do
    #line1.scan = [month,day,year,1200]
    #line 5,6,9 = T,Td,Wind
  require 'open-uri'
  doc = Nokogiri.HTML(open('http://www.nws.noaa.gov/cgi-bin/mos/getmet.pl?sta=KHOU'))
  linearray = doc.xpath('//pre').to_s.lines("\n").to_a
  dt_info = linearray[1].scan(/\d+/)
  dt_info[3] = dt_info[3][0..1]
  startdate = Time.utc(dt_info[2],dt_info[0],dt_info[1],dt_info[3]).to_date
  starthour = dt_info[3].to_i
  # saving this var for later on in development hightemps=linearray[4].scan(/\d+/)
  t=linearray[5].scan(/\d+/)
  d=linearray[6].scan(/\d+/)
  w=linearray[9].scan(/\d+/)

  newdates = (dt_info[3].to_i+6).step(78,3).to_a.map do |step|
    startdate + step.hours
  end

  NamTime.create(startdate:startdate,t_18:newdates[0],t_21:newdates[1],t_24:newdates[2]  \
,t_27:newdates[3],t_30:newdates[4],t_33:newdates[5],t_36:newdates[6],t_39:newdates[7]  \
,t_42:newdates[8],t_45:newdates[9],t_48:newdates[10],t_51:newdates[11] \
,t_54:newdates[12],t_57:newdates[13],t_60:newdates[14], t_63:newdates[15], t_66:newdates[16] \
,t_69:newdates[17],t_72:newdates[18],t_75:newdates[19],t_78:newdates[20] )
  NamTemperature.create(startdate:startdate,t_18:t[0],t_21:t[1],t_24:t[2]  \
,t_27:t[3],t_30:t[4],t_33:t[5],t_36:t[6],t_39:t[7]  ,t_42:t[8],t_45:t[9],t_48:t[10],t_51:t[11] \
,t_54:t[12],t_57:t[13],t_60:t[14], t_63:t[15], t_66:t[16] \
,t_69:t[17],t_72:t[18],t_75:t[19],t_78:t[20] )
  NamDewpoint.create(startdate:startdate,t_18:d[0],t_21:d[1],t_24:d[2]  \
,t_27:d[3],t_30:d[4],t_33:d[5],t_36:d[6],t_39:d[7] ,t_42:d[8],t_45:d[9],t_48:d[10],t_51:d[11] \
,t_54:d[12],t_57:d[13],t_60:d[14], t_63:d[15], t_66:d[16] \
,t_69:d[17],t_72:d[18],t_75:d[19],t_78:d[20] )
  NamWind.create(startdate:startdate,t_18:w[0],t_21:w[1],t_24:w[2]  \
,t_27:w[3],t_30:w[4],t_33:w[5],t_36:w[6],t_39:w[7] ,t_42:w[8],t_45:w[9],t_48:w[10],t_51:w[11] \
,t_54:w[12],t_57:w[13],t_60:w[14], t_63:w[15], t_66:w[16] \
,t_69:w[17],t_72:w[18],t_75:w[19],t_78:w[20] )

 end
