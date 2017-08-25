require 'rails_helper'
require 'scraping'

describe Page do
  describe ".title" do
    context "given an www.cajalosandes.cl" do
      pageUrl = "https://www.cajalosandes.cl"
      page = Page.new(pageUrl)

      it 'When parse_page not null' do
        expect(page.parse_page).not_to eq(nil)
      end

      it "When title not null" do
        expect(page.title).not_to eq(nil)
      end
      it "When description not null" do
        expect(page.meta_description).not_to eq(nil)
      end
      it "When meta keywords not null" do
        expect(page.meta_keywords).not_to eq(nil)
      end
      it 'When children links is > 0' do
        expect(page.children_links.count).to be > 0
      end
    end
  end
end
