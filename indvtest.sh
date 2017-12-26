#!/bin/bash
x=0
echo '<html>' > index.html
echo '<head>' >> index.html
echo '<link rel="shortcut icon" type="image/jpeg" href="/home/phanirithvij2000/Pictures/Junk/One%20piece%20logo.jpg">' >> index.html
echo '<title>' >> index.html
echo One Piece manga >> index.html
echo '</title>' >> index.html
echo '</head>' >> index.html
echo '<body>' >> index.html
i=`pwd | rev | cut -d '/' -f 2 | rev`
an=`dirname $PWD`
p=${PWD##*/}
p=$((p-1)) #previous chapter number is p here
m=$((p+2)) #next chapter number is m here
if [ -d "$an/$p" ]
then
echo "<a href=\"$an/$p/index.html\">previous</a>" >> index.html
fi
if [ -d "$an/$m" ]
then
echo "<a href=\"$an/$m/index.html\">next</a>" >> index.html
fi
for i in `ls -v -1 | egrep 'jpg|png|jpeg'`
do
x=$((x+1))
echo "<p id=\"$x\"><img onload=\"onLoadImg(this);\" src=\"$i\"></p>" >> index.html
done
#select section needs to be done 
#get it from /home/phanirithvij2000/Pictures/Junk/furthermorejunk/mangatest/test.sh 
#select bar to go to a page
cou=$x
echo '<select size="1" name="links" onchange="window.location.href=this.value;">' >> index.html
for ((id=1;id<=cou;id++))
do
echo "<option value=\"#$id\">Page $id </option>" >> index.html
done
echo "</select>" >> index.html
echo '</body>' >> index.html
echo '</html>' >> index.html
