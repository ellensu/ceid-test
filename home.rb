require 'rubygems'
require 'sinatra'
require 'haml'

# routes



get '/' do
  @upcoming = read_upcoming_events

  haml :index
end

# google calendar access logic

def read_upcoming_events
  # from google calendar's settings page
  # this is the public XML link
  cal_url = "http://www.google.com/calendar/feeds/yale.edu_pj57k5d89s4ir70v87jjlps7oo%40group.calendar.google.com/public/basic"
  options = { :future_events => true }
  events = read_calendar cal_url, options
  
  events.reverse
end

REQUEST_CACHE = {}

def read_calendar(url, options = {})
  require 'net/http'
  require 'rexml/document'
		
  url = url.gsub("/basic", "/full") + "?orderby=starttime&"
  url += "futureevents=true&" if options[:future_events]
  url += "end-max=" + Date.today.rfc3339 + "&" if options[:only_today]

  # request data from url
  xml_data = Net::HTTP.get_response(URI.parse(url)).body
  doc = REXML::Document.new(xml_data)

  # parse events XML
  events = []
  doc.elements.each('feed/entry') do |e|
    when_elem = e.elements["gd:when"]
    event = {
      :start => Time.parse(when_elem.attributes["startTime"]),
      :end => Time.parse(when_elem.attributes["endTime"]),
      :title => e.elements["title"].text
    }
    events << event
  end
  events
end


	
