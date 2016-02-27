
     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 

https://www.distilled.net/resources/web-scraping-with-ruby-and-nokogiri-for-beginners/
http://ruby.bastardsbook.com/chapters/html-parsing/
http://stackoverflow.com/questions/1474688/nokogiri-how-to-select-nodes-by-matching-text

start server with angular2
--------------------------
1. 	First run lite-server as follows: npm start --port $PORT
	This is using the script detailed in package.json
	Its based on the angular2 quickstart guide: https://angular.io/docs/js/latest/quickstart.html
2.  Then click 'Run' button in cloud9, with the following runner selected: Runner: Apache httpd (PHP, HTML)
3.  Go to https://library-app-karinelisabeth.c9users.io/index.html

URLS:
----
* All fiction page with search criteria
url_all_fiction = 'http://llc.lib.overdrive.com/' + 'BANGSearch.dll?Type=SubjectList&ID=9886&PerPage=24&SortBy=CollDate)'

html snippet structure:
------------------------

.css('.tc-author)

#<Nokogiri::XML::Element:0x2287164 name="a" 
	attributes=[
		#<Nokogiri::XML::Attr:0x2554b80 name="class" value="tc-author">, 
		#<Nokogiri::XML::Attr:0x2554b6c name="href" value="BANGSearch.dll?Type=Creator&ID=624869&PerPage=24&SortBy=CollDate">, 
		#<Nokogiri::XML::Attr:0x2554b58 name="title" value="Search for other content by Christina Baker Kline">, 
		#<Nokogiri::XML::Attr:0x2554b44 name="aria-label" value="Search for other content by Christina Baker Kline">
		] 
	children=[
		#<Nokogiri::XML::Text:0x25540f4 "Christina Baker Kline">
		]
	>, 


[
#<Nokogiri::XML::Element:0x20af634 name="span" 
	attributes=[
		#<Nokogiri::XML::Attr:0x20af5d0 name="class" value="desc-exp-col">, 
		#<Nokogiri::XML::Attr:0x20af5bc name="dir" value="auto">
		] children=[
			#<Nokogiri::XML::Text:0x20aee64 "\r\n">, 
			#<Nokogiri::XML::Element:0x20aed4c name="p" 
			children=[#<Nokogiri::XML::Text:0x20aeb58 "Between 1854 and 1929, so-called orphan trains ran regularly from the cities of the East Coast to the farmlands of the Midwest, carrying thousands of abandoned children whose fates would be determined by pure luck. Would they be adopted by a kind and loving family, or would they face a childhood and adoles-cence of hard labor and servitude?">
				]>, 
		#<Nokogiri::XML::Element:0x20ae98c name="p" 
			children=[#<Nokogiri::XML::Text:0x20ae798 "As a young Irish immigrant, Vivian Daly was one such child, sent by rail from New York City to an uncertain future a world away. Returning east later in life, Vivian leads a quiet, peaceful existence on the coast of Maine, the memories of her upbringing rendered a hazy blur. But in her attic, hidden in trunks, are vestiges of a turbulent past.">
				]>, 
		#<Nokogiri::XML::Element:0x20ae5cc name="p" 
			children=[#<Nokogiri::XML::Text:0x20ae338 "Seventeen-year-old Molly Ayer knows that a community-service position helping an elderly widow clean out her attic is the only thing keeping her out of juvenile hall. But as Molly helps Vivian sort through her keepsakes and possessions, she discovers that she and Vivian aren't as different as they appear. A Penobscot Indian who has spent her youth in and out of foster homes, Molly is also an outsider being raised by strangers, and she, too, has unanswered questions about the past.">
				]>, 
		#<Nokogiri::XML::Element:0x20ae180 name="p" 
			children=[
			#<Nokogiri::XML::Text:0x20abf70 "Moving between contemporary Maine and Depression-era Minnesota, ">, 
			#<Nokogiri::XML::Element:0x20abea8 name="em" 
				children=[#<Nokogiri::XML::Text:0x20abca0 "Orphan Train">
				]>, 
			#<Nokogiri::XML::Text:0x20abae8 " is a powerful tale of upheaval and resilience, second chances, and unexpected friendship.">
			]>, 
		#<Nokogiri::XML::Text:0x20ab91c "\r\n        ">
	]>
]