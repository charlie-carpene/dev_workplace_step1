require 'csv'

class Parser
    def read_file(file)
        return File.read(file)
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
end