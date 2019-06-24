module CompareFiles
  class DiffTools
    # pass in arrays of filtered items to compare against one another

    def self.new_right(left, right)
      right - left
    end

    def self.new_left(left, right)
      left - right
    end
  end
end
