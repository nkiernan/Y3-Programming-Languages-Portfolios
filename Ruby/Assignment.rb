class MyString
    attr_accessor :str
    attr_reader :letters
    
    def initialize(string="Hello, World!")
        @str = string
        @letters = {}
    end

    def histogram
        frequency
        ("A".."Z").each {|x| puts "#{x}: " + "*" * letters[x]}
    end

    private
    
    attr_writer :letters

    def frequency
        freq = String.new(str)
        freq.upcase!.gsub!(/\W+/, '')
        letters.clear
        letters.default = 0
        freq.each_char {|char| letters[char] += 1}
    end
end