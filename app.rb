require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'parser'

def file_1(parser)
   file = parser.read_file
   cleaned_file = parser.clean_quote(file)
   parser.print_in_terminal(cleaned_file, false)
end

def file_2(parser)
   file = parser.read_file
   cleaned_file = parser.invert_semicolon_and_comma(file)
   parser.print_in_terminal(cleaned_file, true)
end

def file_3(parser)
   file = parser.read_file
   cleaned_file = parser.invert_semicolon_and_comma(file)
   parser.print_in_terminal(cleaned_file, true)
end

def perform
   @parser = Parser.new()

   @parser.path = "assets/countries.csv"
   file_1(@parser)

   @parser.path = "assets/embassy.csv"
   file_2(@parser)

   @parser.path = "assets/french-foreigners.csv"
   file_3(@parser)
end

perform