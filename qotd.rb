require "nokogiri"
require "mechanize"
require 'phantomjs'
require 'watir'


url = "http://www.forbes.com/quotes/"
fp = File.new("../Quotes.txt", "w")


b = Watir::Browser.new(:phantomjs)
b.goto(url)

doc = Nokogiri::HTML(b.html)

list = doc.xpath("//blockquote[@class='bubble ng-scope']")

list.each { |i| fp.write( "\""+(i.text.gsub('Share  F   ', "\"\n -")) +"\n") }

File.open("../.bash_profile", "a"){ |f|
	f<< "root=$( cd \"$( dirname \"${BASH_SOURCE[0]}\" )\" && pwd )

line1=$(sed -n '3p' < $root/Quotes.txt)
line2=$(sed -n '4p' < $root/Quotes.txt)

size=$(tput cols)

for i in $(seq 1 $size)
do
  	printf \"-\"
done

printf \"\n\"

echo $line1
echo $line2

for i in $(seq 1 $size)
do
  	printf \"-\"
done

printf \"\n\""
}




