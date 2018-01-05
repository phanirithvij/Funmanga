Well,well,well what have we got here?

==> Manga downloader by Phani Rithvij

==> Download Manga from https://www.funmanga.com/

==> Arranges them in a read-able format a html format

Requirements :

1. wget 

2. linux system


+> Steps to follow
1)
Do this in terminal(In the directory Manga you are in)
Copy and paste it if you want to

	#START

	#STEP1

	chmod 777 *.sh
	./1Procstart.sh


	#STEP2

	#Read chapters.txt
	#Read examples.txt
	cd www.funmanga.com/uploads/chapters/
	cat chapters.txt examples.txt

	#END

2)
Now go to http://www.funmanga.com/

search the manga you want

I recommend One piece,Attack on Titan,Shokugeki no Soma,One Punch Man(Not Available I think)

copy the link you are now in and do this in chapters/ directory

	./wget.sh url 

It can download that particular chapter which you are in 
or The Entire Manga of the link you specified

3)
Now go inside the downloaded directory (eg: 5404/ if One piece)

do 

	cp ../testforall.sh ./
	./testforall

4)
Go inside the first directory and you will find index.html
do
	cd 0/
	firefox index.html #I'm Using firefox
	#or
	#xdg-open index.html 

       					       ENJOY

#********************************************Thank you*******************************************************

(Optional)=>

you can also paste links of the form 
	http://www.funmanga.com/uploads/chapters/5404/
	This is where the website's files are located
It will be fast and easy
