require 'uri'

class Tree
  attr_reader :domain, :root_path, :links

  def initialize(root_path)
    @root_path = root_path
    @domain = get_host(root_path)
    @links = Array.new
  end

  def tree_maping
    pageHome = Page.new(@root_path)
    walk_tree(pageHome)
  end

  def walk_tree(page)
    #Almaceno en @tree datos de page
    if page.children_links.count > 0
      page.children_links.each do |link|
        arr = link.split("/")
        length = arr.length
        length = length - 1 if arr[0].to_s.empty?
        host = get_host(link)
        scheme = get_scheme(link)
        if valid_link(link, host, scheme)
          @links.push(:url => link, :length => length, :host => host, :scheme => scheme)
          page = Page.new(scheme + '://' + host + link)
          walk_tree(page)
        end
      end
    end
  end

  def get_host(url)
    url = URI.encode(url)
    uri = URI.parse(url)
    uri = URI.parse("https://#{url}") if uri.scheme.nil?
    uri = URI.parse("http://#{url}") if uri.scheme.nil?
    if uri.host.nil?
      return @domain
    else
      return uri.host.downcase
    end
  end

  def get_scheme(url)
    url = URI.encode(url)
    uri = URI.parse(url)
    uri = URI.parse("https://#{url}") if uri.scheme.nil?
    uri = URI.parse("http://#{url}") if uri.scheme.nil?
    uri = URI.parse("http://#{@domain + url}") if uri.scheme.nil?
    uri = URI.parse("https://#{@domain + url}") if uri.scheme.nil?
    uri.scheme
  end

  def valid_link(link, host, scheme)
    valid = !@links.any? { |x| x[:url] == link }
    if valid == false
      valid = true if host == @domain && scheme != nil
    end
    return valid
  end

  def internal_links
    return @links.select { |x| x[:host] == @domain }
  end

  def external_links
    return @links.select { |x| x[:host] != @domain }
  end

end