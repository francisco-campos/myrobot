require 'open-uri'
require 'Nokogiri'

class Page
  attr_reader :title, :link, :parse_page

  def initialize(link_page)
    @link = link_page
    @parse_page = Nokogiri::HTML(open(link_page))
    @childrens = Array.new
  end

  def title
    title = @parse_page.at_css('title').text
    return clean_text(title)
  end

  def meta_description
    content = @parse_page.xpath('//meta[@name="description"]/@content').map(&:value)[0]
    return content
  end

  def meta_keywords
    content = @parse_page.xpath('//meta[@name="keywords"]/@content').map(&:value)[0]
    return content
  end

  def children_links
    if @childrens.count == 0
      search_childrens
    end
    return @childrens
  end

  private
    def search_childrens
      links = @parse_page.css('a')
      links.each do |link|
        if link['href'] != '#' && link['href'] != '/'
          href = ToolPage.format_link(link['href'])
          @childrens.push(href)
        end
      end
      @childrens.sort_by!{ |m| m }
    end

    def clean_text(text)
      text.delete!("\n")
      text.delete!("\r")
      text.delete!("\t")
      return text
    end
end