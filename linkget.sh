if [[ $1 == *http* ]]
then
name=`echo $1 | cut -d "/" -f4`
ch=`echo $1 | cut -d "/" -f5`
else
name=`echo $1 | cut -d "/" -f2`
ch=`echo $1 | cut -d "/" -f3`
fi

if [ "$ch" == "" ] #chapter not specified => entire manga
then
t='/1/'
l=$1$t
wget $l -q -O .tmp.html
num=`cat .tmp.html | grep '<img src="http://www.funmanga.com/uploads/chapters/' | cut -d "/" -f6`
./wget.sh www.funmanga.com/uploads/chapters/$num/
rm .tmp.html
else
echo Do you know that this manga is ordered and stored in www.funmanga.com/uploads/chapters/$num/$cha/
wget $1 -q -O .tmp.html
num=`cat .tmp.html | grep '<img src="http://www.funmanga.com/uploads/chapters/' | cut -d "/" -f6`
cha=`cat .tmp.html | grep '<img src="http://www.funmanga.com/uploads/chapters/' | cut -d "/" -f7`
./wget.sh www.funmanga.com/uploads/chapters/$num/$cha/
rm .tmp.html
fi


if ! grep -q $name "chapters.txt" #if not found in chapters.txt
then
echo "$num" '"'"$name"'"' >> chapters.txt     # add to chapters.txt
fi

