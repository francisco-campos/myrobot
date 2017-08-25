class ToolPage

  def self.format_link(link)
    return '#' if link == nil
    if link[0] != 'h' && link[0] != '/' && link[0] != '#'
      return '/' + link
    end
    return link
  end

  def self.order_links(pages)
    pages.sort_by { |x| x[:url] }
  end

end