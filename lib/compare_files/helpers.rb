module CompareFiles
  class Helpers
    def self.split_lines(large_string)
      large_string.split("\n").reduce([]) do |acc, line|
        ln = line.strip
        acc << ln unless ln == ""
        acc
      end
    end
  end
end
