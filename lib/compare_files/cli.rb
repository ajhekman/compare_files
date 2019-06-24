require 'optparse'

module CompareFiles
  class Cli
    def self.parse!

      args = Struct.new(:left, :right).new

      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: compare_files [options]"

        opts.on("--left=LEFT", "'old' side to compare against. May be a folder, or text file.") do |op|
          args.left = op
        end

        opts.on("--right=RIGHT", "'current' side to compare against. May be a folder, or text file.") do |op|
          args.right = op
        end

        opts.on("-h", "--help", "Prints this help") do
          opts.summary_width = 20
          puts opts
          exit
        end

        opts.on("-v", "--version", "Prints the version (#{VERSION})") do
          puts VERSION
          exit
        end
      end

      opt_parser.parse!
      return args
    end

    def self.standardize_input(input)
      case
      when Pathname.new(input).directory?
        DirectoryList.list_of_files(input)

      when Pathname.new(input).file?
        file_as_str = File.open(input) do |file|
          file.read
        end
        Helpers.split_lines(file_as_str)

      when input.is_a?(Array)
        input
      else
        raise CompareFiles::Error, "unknown input type: #{input.class} "
      end
    end
  end
end
