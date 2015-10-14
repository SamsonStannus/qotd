require 'nokogiri'
require 'mechanize'
require 'phantomjs'
require 'watir'



url = "http://www.forbes.com/quotes/"
fp = File.new("../Quotes.txt", "w")


b = Watir::Browser.new(:phantomjs)
b.goto(url)

doc = Nokogiri::HTML(b.html)

list = doc.xpath("//blockquote[@class='bubble ng-scope']")

first = true
list.each { |i| text = (i.text.gsub('Share  F   ', "\"\n -"))
	if first == false
		fp.write( "\""+ text.gsub(/([A-Z][a-z]*)[A-Z]/.match(text).captures.join(""), "") +"\n")
	else
		fp.write( "\""+ text +"\n")
		first = false
	end
	
}






