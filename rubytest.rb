require 'rubygems'
require 'sinatra'
require 'haml'

# routes

date = Date.today.strftime "%Y%m%d"
	embed_url = "<iframe src=\"https://www.google.com/calendar/embed?showTitle=0&amp;showNav=0&amp;showDate=0&amp;showPrint=0&amp;showTabs=0&amp;showTz=0&amp;showCalendars=0&amp;mode=DAY&amp;height=1080&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=yale.edu_pj57k5d89s4ir70v87jjlps7oo%40group.calendar.google.com&amp;color=%235F6B02&amp;src=yale.edu_tp5hu0imtdjbt39qnim2kd0dv0%40group.calendar.google.com&amp;color=%23182C57&amp;src=yale.edu_v5a8sdqrnsu6j112cckp6t3iu4%40group.calendar.google.com&amp;color=%23711616&amp;ctz=America%2FNew_York&dates=todaysdate/todaysdate\" style=\" border-width:0 \" width=\"500\" height=\"1080\" frameborder=\"0\" scrolling=\"no\"></iframe>"
	puts embed_url.gsub("todaysdate", date)
