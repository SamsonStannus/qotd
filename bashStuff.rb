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
