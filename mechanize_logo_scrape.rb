require 'nokogiri'
require 'open-uri'
require 'pp'
require 'mechanize'


doc = Nokogiri::HTML(open("http://search.aol.com/aol/search?s_it=topsearchbox.search&s_chn=prt_main5&v_t=comsearch&q=goog+logo"))

pp doc.css("img").first['src']
