require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'parser'

def print_in_terminal(parser, cleaned_file, file_has_header)
   csv_file = parser.parse(cleaned_file, file_has_header)
   csv_file.each do |line|
      puts line.inspect
  end
end

def file_1(parser)
   file = parser.read_file("assets/countries.csv")
   cleaned_file = parser.clean_quote(file)
   print_in_terminal(parser, cleaned_file, false)
end

def file_2(parser)
   file = parser.read_file("assets/embassy.csv")
   cleaned_file = parser.invert_semicolon_and_comma(file)
   print_in_terminal(parser, cleaned_file, true)
end

def file_3(parser)
   file = parser.read_file("assets/french-foreigners.csv")
   cleaned_file = parser.invert_semicolon_and_comma(file)
   print_in_terminal(parser, cleaned_file, true)
end

def perform
   parser = Parser.new()
   file_1(parser)
   file_2(parser)
   file_3(parser)
end

perform