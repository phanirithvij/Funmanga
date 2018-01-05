#!/bin/bash
#pwd inside anime eg: pwd=5404/.
tot=`ls -1 -v | wc -l`
for h in `ls -1 -v`
do
if [ -d $h ]
then
	#if [ -f indvtest.sh ]
	#then
	#cp indvtest.sh $h/
	#fi
rm $h/index*
x=0
ew=${PWD##*/}
nam=`cat ../chapters.txt | grep "$ew" | cut -d "\"" -f2`
echo '<html>' > $h/index.html
echo '<head>' >> $h/index.html
if [ -f /home/phanirithvij2000/Pictures/Junk/One_piece_logo.jpg  ]
then
echo '<link rel="shortcut icon" type="image/jpeg" href="/home/phanirithvij2000/Pictures/Junk/One_piece_logo.jpg">' >> $h/index.html
else
echo give the link for any image to be your logo
read img
ty=`echo $img | rev | cut -d "." -f1 | rev`
echo "<link rel=\"shortcut icon\" type=\"image/$ty\" href=\"$img\">" >> $h/index.html
fi
echo '<title>' >> $h/index.html
echo "$nam $h" >> $h/index.html
echo '</title>' >> $h/index.html
echo '</head>' >> $h/index.html
echo '<body>' >> $h/index.html
l=`pwd`
cat ../style.txt >> $h/index.html
cat ../script.txt >> $h/index.html
cat ../content.txt >> $h/index.html
#i=`pwd | rev | cut -d '/' -f 2 | rev`
#an=`dirname $PWD`
p=$((h-1)) #previous chapter number is p here
#echo prev of $h : $p
m=$((h+1)) #next chapter number is m here
#echo next of $h : $m
if [ -d "$l/$p" ]
then
	echo "<a href=\"$l/$p/index.html\" id=\"prev\" >previous</a>" >> $h/index.html
fi
echo '<select size=1 name="chapters" id="myBtn3" onchange="window.location.href=value;" style="width : 380px;">' >> $h/index.html
for ((cd=0;cd<=tot;cd++))
do
	if [ -d $cd ]
	then
		echo "<option value=\"../$cd/index.html\">chapter $cd</option>" >> $h/index.html
	fi
done
echo "</select>" >> $h/index.html
if [ -d "$l/$m" ]
then
echo "<a href=\"$l/$m/index.html\" id=\"next\">next</a>" >> $h/index.html
fi
echo '<br/>' >> $h/index.html
for i in `ls -v -1 $h | egrep 'jpg|png|jpeg'`
do
	x=$((x+1))
done
#select bar to go to a page
cou=$x
echo '<select size="1" name="links" id="myBtn4" onchange="window.location.href=this.value;">' >> $h/index.html
for ((id=1;id<=cou;id++))
do
	echo "<option value=\"#$id\">Page $id </option>" >> $h/index.html
done
echo "</select>" >> $h/index.html
echo '</div></div>' >> $h/index.html
de=0
for i in `ls -v -1 $h | egrep 'jpg|png|jpeg'`
do
de=$((de+1))
echo "<p id=\"$de\"><img onload=\"onLoadImg(this);\" src=\"$i\"></p>" >> $h/index.html
done
echo '</body>' >> $h/index.html
echo '</html>' >> $h/index.html
fi
done
