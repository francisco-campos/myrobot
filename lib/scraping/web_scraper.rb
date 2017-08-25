#require 'HTTParty'
require 'open-uri'
require 'Nokogiri'
require 'JSON'
require 'csv'

class WebScraper
  attr_accessor :tree

  def initialize(root_path)
    @tree = Array.new
    @current_link = root_path
    @root_path = root_path
  end

  def walk_tree(page)

  end

end