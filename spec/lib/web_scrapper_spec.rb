require 'rails_helper'
require 'scraping'

describe WebScraper do

  describe ".walk_tree" do
    context "given an clinica2.fusionadns.cl" do
      it "returns N pages" do
        page = "https://www.cajalosandes.cl"
        scraper = WebScraper.new(page)
        expect(scraper.tree).to eql(Array[])
      end
    end
  end
end
