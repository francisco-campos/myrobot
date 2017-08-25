require 'rails_helper'
require 'scraping'

describe Tree do
  describe '.get_host' do
    context 'With www' do
      it 'return domain with www' do
        site = Tree.new("https://www.cajalosandes.cl")
        expect(site.domain).to eql('www.cajalosandes.cl')
      end
    end
    context 'Without www' do
      it 'return domain without www' do
        site = Tree.new("https://cajalosandes.cl")
        expect(site.domain).to eql('cajalosandes.cl')
      end
    end
  end
  describe '.get_scheme' do
    context 'With http' do
      it 'return protocol http' do
        site = Tree.new("https://www.cajalosandes.cl")
        expect(site.get_scheme('/test')).to eql("https")
      end
    end
  end
  describe "Tree Class" do
    context "given an page: https://www.cajalosandes.cl" do
      it "returns domain: https://www.cajalosandes.cl" do
        site = Tree.new("https://www.cajalosandes.cl")
        expect(site.domain).to eql("www.cajalosandes.cl")
      end
      it "returns domain: www.cajalosandes.cl" do
        site = Tree.new("www.cajalosandes.cl")
        expect(site.domain).to eql("www.cajalosandes.cl")
      end
    end

    context "given an page: https://www.cajalosandes.cl" do
      site = Tree.new("https://www.cajalosandes.cl")
      it "returns tree of https://www.cajalosandes.cl" do
        site.tree_maping
        expect(site.links.length).to be > 0
      end
      it "returns internal links" do
        expect(site.internal_links).to eql("")
      end
    end

  end
end
