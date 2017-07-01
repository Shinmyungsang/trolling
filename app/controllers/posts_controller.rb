require 'open-uri'
class PostsController < ApplicationController
  def index
    
    @titles = Array.new
    
    15.downto(1) do |p|
      doc = Nokogiri::HTML(open("http://www.inven.co.kr/board/powerbbs.php?come_idx=4677&query=list&my=&category=&category2=&sort=PID&orderby=&name=&subject=&content=&keyword=&sterm=&eq=&iskin=&mskin=&p=#{p}"))
      
      doc.css(".bbsSubject//a").each do |x|
        trol = params[:trol]
        @titles <<x.inner_text if x.inner_text.include?("#{trol}")
      end
      
    end
  end
end
