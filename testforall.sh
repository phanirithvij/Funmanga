#!/bin/bash
#pwd inside anime eg: pwd=5404/.
for h in `ls -1 -v`
do
if [ -d $h ]
then
cp indvtest.sh $h/
rm $h/index*
x=0
nam=`cat ../chapters.txt | grep "$h" | cut -d "\"" -f2`
echo '<html>' > $h/index.html
echo '<head>' >> $h/index.html
echo '<link rel="shortcut icon" type="image/jpeg" href="/home/phanirithvij2000/Pictures/Junk/One%20piece%20logo.jpg">' >> $h/index.html
echo '<title>' >> $h/index.html
echo "$nam" >> $h/index.html
echo '</title>' >> $h/index.html
echo '</head>' >> $h/index.html
echo '<body>' >> $h/index.html
#i=`pwd | rev | cut -d '/' -f 2 | rev`
#an=`dirname $PWD`
l=`pwd`
p=$((h-1)) #previous chapter number is p here
#echo prev of $h : $p
m=$((h+1)) #next chapter number is m here
#echo next of $h : $m
if [ -d "$l/$p" ]
then
echo "<a href=\"$l/$p/index.html\">previous</a>" >> $h/index.html
fi
if [ -d "$l/$m" ]
then
echo "<a href=\"$l/$m/index.html\">next</a>" >> $h/index.html
fi
for i in `ls -v -1 $h | egrep 'jpg|png|jpeg'`
do
x=$((x+1))
echo "<p id=\"$x\"><img onload=\"onLoadImg(this);\" src=\"$i\"></p>" >> $h/index.html
done
#select bar to go to a page
cou=$x
echo '<select size="1" name="links" onchange="window.location.href=this.value;">' >> $h/index.html
for ((id=1;id<=cou;id++))
do
echo "<option value=\"#$id\">Page $id </option>" >> $h/index.html
done
echo "</select>" >> $h/index.html
echo '</body>' >> $h/index.html
echo '</html>' >> $h/index.html
fi
done
