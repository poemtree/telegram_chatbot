require 'rest-client'
require 'json'
require 'nokogiri'
require 'figaro'
token = ENV["telegram_token"]

url = "https://api.telegram.org/bot#{token}/getUpdates"
telegram=RestClient.get(url)
res_json=JSON.parse(telegram)
user_id=res_json['result'][0]['message']['from']['id']

# msg="까다로운 남자 증슨우"
# msg_url=URI.encode("https://api.telegram.org/bot#{token}/sendmessage?chat_id=#{user_id}&text=#{msg}")

# @url =URI.encode("https://www.melon.com/chart/index.htm?n_media=27758&n_query=멜론탑100&n_rank=1&n_ad_group=grp-m001-01-000001211566346&n_ad=nad-a001-01-000000034687448&n_keyword_id=nkw-m001-01-000001842858431&n_keyword=멜론탑100&n_campaign_type=1")
@url =URI.encode("https://www.melon.com/chart/index.htm")
@music_html = RestClient.get(@url)
@music_doc = Nokogiri::HTML(@music_html)
@music_url= @music_doc.css("div.ellipsis.rank01 a")

@music_list=[]

@music_url.each do |x|
    @music_list << x.text
end

@top_10="멜론Top10"+"\n"

10.times do |i|
    @top_10 << "#{i+1}등 "+@music_list[i]+"\n"
end

msg = @top_10
msg_url=URI.encode("https://api.telegram.org/bot#{token}/sendmessage?chat_id=#{user_id}&text=#{msg}")
RestClient.get(msg_url )

# 10.times do |i|
#     msg = "#{i+1}등."+@music_list[i]
#     msg_url=URI.encode("https://api.telegram.org/bot#{token}/sendmessage?chat_id=#{user_id}&text=#{msg}")
#     RestClient.get(msg_url )
# end



# 10.times do |i|
#   puts @music_list[i]
# end

# @url = "https://movie.naver.com/movie/running/current.nhn?type=jpg"
# @movie_html = RestClient.get(@url)
# @movie_doc = Nokogiri::HTML(@movie_html)
# @movie_url= @movie_doc.css("ul.lst_detail_t1")

# 10.times do
# @movie_list = []
# @movie_url.css("dt.tit a").each do |x|
#     @movie_list << x.text
# end
# puts @movie_list
# 10.times do |i|
#     puts @movie_list[i]
# end
# end
# puts @movie_url
