$:.unshift File.expand_path("./../lib", __FILE__)
require 'parser'

RSpec.describe Parser do
  let(:parser) { Parser.new() }

  context  "with no path" do
    it "should be nil" do
      expect(parser.path).to eq(nil)
    end
  end

  context "with a path" do
    it "should be able to delete quote from string" do
      string = 'te"st'
      expect(parser.clean_quote(string)).to eq("test")
    end

    it "should be able to invert semicolon and comma" do
      string = "test;inverting,semi,;and;,"
      expect(parser.invert_semicolon_and_comma(string)).to eq("test,inverting;semi;,and,;")
    end

    it "should be able to parse to csv a cleaned file" do
      cleaned_file = "1,chocolate\n2,bacon\n3,apple"
      expect(parser.parse(cleaned_file, false)[1][1]).to eq("bacon")

      cleaned_file = "id,name\n1,chocolate\n2,bacon\n3,apple"
      expect(parser.parse(cleaned_file, true)[2][1]).to eq("apple")
    end

    it 'should be able to print in terminal' do
      parser.path = "assets/countries.csv"
      expect(parser.print_in_terminal(parser.clean_quote(parser.read_file), false)).to be_kind_of(Array)
    end
  end
end
  