

module CompareFiles
  class DirectoryList

    # Recursivly list files contained within `dir_name`
    def self.list_of_files(dir_name)
      raise CompareFiles::Error, "'#{dir_name}' is not a directory" unless Pathname.new(dir_name).directory?
      error_code = nil
      find_output = nil
      FileUtils.cd(dir_name) do
        find_output = `find . -type f | cut -b 3-`
        error_code = $?.to_i
        raise CompareFiles::Error, "Listing files failed" if (error_code || 1) > 0
      end
      Helpers.split_lines(find_output)
    end
  end
end
