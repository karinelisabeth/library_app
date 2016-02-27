require 'nokogiri'
require 'httparty'
require 'pry'
require 'json'
require 'erb'
require 'mechanize'
# installing rails, as nikkou won't work otherwise
require 'rails'
require 'nikkou'


#http://stackoverflow.com/questions/24844336/how-to-make-html-erb-file-work-outside-of-rails
#http://ruby-log.blogspot.co.uk/2013/03/generating-static-html-using-erb.html
#http://docs.seattlerb.org/mechanize/GUIDE_rdoc.html
#https://lostechies.com/rodpaddock/2011/04/11/hacking-websites-with-ruby-and-nokogiri/

#*******************************
# Convert URL to nokogiri object
#*******************************

def url_obj (url)
    url_1 = HTTParty.get(url)
    return Nokogiri::HTML(url_1)
end

#*****************
# Parsed pages
#*****************

@parse_all_fiction_page = url_obj('http://llc.lib.overdrive.com/' + 'BANGSearch.dll?Type=SubjectList&ID=9886&PerPage=5&SortBy=globalrank)')

@single_details_url_for_test = url_obj('http://llc.lib.overdrive.com/ContentDetails.htm?id=365E31DF-D292-44D6-98B6-20ACD2542A28')

#*****************
# Books json
#*****************
# http://stackoverflow.com/questions/15509170/scraping-table-with-nokogiri-and-need-json-output

books = {}
@parse_all_fiction_page.css('.title-element-li').map.with_index do |item, i|
    
    #*********************
    # Variables
    #********************
    book_id = item.css('img.wtil-cover')[0]['data-crid']
    
    details_url = 'http://llc.lib.overdrive.com/ContentDetails.htm?id='+ book_id
    details_url_get = HTTParty.get(details_url)
    details = Nokogiri::HTML(details_url_get)
    
    #**End Variables*******************
    
    formats = []
    details.css('ul.formats-at-download').css('li.details-other-formats').map do |f|
        text = f.children[0].text
        formats.push(text)
    end
    
    subjects = {}
    details.css('ul.subjects-expand').css('li').map.with_index do |s, i|
        subjects[:"subject_#{i}"] = {
            href: s.css('a')[0]['href'],
            name: s.css('a').text
        }
    end
    
    description = ''
    details.css('.desc-exp-col').css('p').map do |text| 
        description << '<p>' + text + '</p>' 
    end
    
    author_description = ''
    details.css('ul.ata-expand').css('p').map do |text|
        author_description << '<p>' + text + '</p>'
    end
    
    books[:"book_#{i}"] = {
        book_id: book_id,
        author: item.css('.tc-author').text,
        author_description: author_description,   #will prob break if there is an authorimage
        author_href: 'http://llc.lib.overdrive.com/' + item.css('.tc-author')[0]['href'],
        title: item.css('.tc-title').text,
        thumbnail_url: 'https:' + item.css('img.wtil-cover')[0]['data-original'],
        details_url: details_url,
        sample_url: item.css('.info-span').css('a.sample-button')[0]['href'],
        meta_data: {
            publisher: details.css('div.publisher-info').text,  
            isbn: details.css('.row.bg-shift')[4].css('.titleInfoRight').text,
            release_date: details.css('.row.bg-shift')[5].css('.titleInfoRight').css('noscript').text,
            #missing audio-book details
            formats: formats,
            subjects: subjects,
            data_copiesavail: item.css('.img-and-info-contain')[0]['data-copiesavail'],
            data_copiestotal: item.css('.img-and-info-contain')[0]['data-copiestotal'],
            data_numwaiting: item.css('.img-and-info-contain')[0]['data-numwaiting'],
            data_isowned: item.css('.img-and-info-contain')[0]['data-isowned'],
            data_isrec: item.css('.img-and-info-contain')[0]['data-isrec'],
            data_isreclimit: item.css('.img-and-info-contain')[0]['data-isreclimit'],
            data_encodedurl: item.css('.img-and-info-contain')[0]['data-encodedurl']
        },
        detailed_data: {
            full_image_url: 'http://llc.lib.overdrive.com/' + 'ContentDetails-Cover.htm?ID=' + book_id,
            description: description
        }
   }
end

Pry.start(binding)

template = ERB.new(File.read("index.html.erb"))
html_content = template.result(binding)

File.open("index.html", "w") do |file|
  file.puts html_content
end
