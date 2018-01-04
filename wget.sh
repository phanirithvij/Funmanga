#!/bin/bash
	#pwd : /home/phanirithvij2000/Pictures/Junk/furthermorejunk/funmanga/www.funmanga.com/uploads/chapters/5404
	
p=${PWD##*/}	#If inside the chapters folder
if [ "$p" == "chapters" ]
then
	File="chapters.txt"
	if [ $# -eq 0 ]
	then
	echo -n enter a funmanga link :
	echo check examples.txt
	read link
	else
	link=$1
	fi
	if [[ $link == *funmanga.com* ]]
	then
	if [[ $link == *uploads/chapters/* ]];
	then
	if ! grep -q ${link:42} "$File"; then
		echo enter the anime name
		read name
		if [[ $link == *https* ]]
		then
		fin=${link:42}
		fin=`echo $fin | cut -d '/' -f1`
		fi
		if ! grep -q $name "$File"; then
			echo "$fin \"$name\"" >> chapters.txt
		fi
	fi
	cd ../../../
	wget -N -k -np -r -q --show-progress $link
	cd -
	else
		if [[ $link == *http* ]]
		then
		name=`echo $link | cut -d "/" -f4`
		ch=`echo $link | cut -d "/" -f5`
		else
		name=`echo $link | cut -d "/" -f2`
		ch=`echo $link | cut -d "/" -f3`
		fi
		if grep -q $name "$File"; then
		num=`cat chapters.txt | grep "$name" | cut -d "\"" -f1`
		echo Existing anime
		echo $name 
		echo check $num/
			./linkget.sh $link
 		else
			./linkget.sh $link
		fi
	fi
	else
		echo -e "\n\nERROR\n\n"
		echo ONLY FROM www.funmanga.com/Manga_name/chapter_number or www.funmanga.com/uploads/chapters/something
		echo ' '
		echo check examples.txt for link formats
		exit 1
	fi
else
	File="../chapters.txt"
	p=${PWD##*/} #this is the anime number(inside anime folder eg: 5404/)
if ! grep -q $p "$File"; then
echo enter the anime name
read name
if ! grep -q $name "$File"; then 
echo "$p \"$name\"" >> ../chapters.txt
fi
fi
lftp -e "cls -1 > /tmp/list; exit" "http://www.funmanga.com/uploads/chapters/$p"
	#It gets the names of directories (anime chapters the present anime has) stores in /tmp/list
all=`ls -v -1 /tmp/list`
num=`ls -v -1 /tmp/list | wc -l`
cd ../../../../
#wget must be done here

for i in `cat /tmp/list | sort -n -r`
do
	wget -N -k -np -r -q --show-progress https://www.funmanga.com/uploads/chapters/$p/$i/
done
cd -
fi
