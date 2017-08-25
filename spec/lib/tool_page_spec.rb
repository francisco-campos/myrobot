require 'rails_helper'
require 'scraping'

describe ToolPage do
  describe "ToolPage format_link" do
    context "given an link: http://wwww.google.com" do
      it "returns domain: http://wwww.google.com" do
        link = ToolPage.format_link('http://wwww.google.com')
        expect(link).to eql("http://wwww.google.com")
      end
    end
    context "given an link: /shortcuts/novedades" do
      it "returns domain: /shortcuts/novedades" do
        link = ToolPage.format_link('/shortcuts/novedades')
        expect(link).to eql("/shortcuts/novedades")
      end
    end
    context "given an link: shortcuts/novedades" do
      it "returns domain: /shortcuts/novedades" do
        link = ToolPage.format_link('shortcuts/novedades')
        expect(link).to eql("/shortcuts/novedades")
      end
    end
    context "given an link null" do
      it "returns: #" do
        link = ToolPage.format_link(nil)
        expect(link).to eql("#")
      end
    end
    context "given an link null" do
      it "returns: #hello" do
        link = ToolPage.format_link('#hello')
        expect(link).to eql("#hello")
      end
    end
  end
end