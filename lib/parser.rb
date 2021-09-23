require 'csv'

class Parser
    attr_accessor :path

    def read_file
        return File.read(self.path)
    end

    def parse(file, header)
        return CSV.parse(file, headers: header)
    end

    def clean_quote(file)
        return file.delete('"')
    end

    def invert_semicolon_and_comma(file)
        temp_file = file.gsub(/,/, "^*^")
        replace_semicolon = temp_file.gsub(/;/, ",")
        add_back_comma_as_semicolon = replace_semicolon.gsub("^*^", ";")
        return add_back_comma_as_semicolon
    end

    def print_in_terminal(cleaned_file, file_has_header)
        csv_file = self.parse(cleaned_file, file_has_header)
        csv_file.each do |line|
           puts line.inspect
       end
    end
end
