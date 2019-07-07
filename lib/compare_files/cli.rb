require 'optparse'

module CompareFiles
  class Cli
    def self.parse!

      args = Struct.new(:left, :right, :remember).new

      opt_parser = OptionParser.new do |opts|
        opts.banner = <<~BANNER
          Usage: compare_files --left=SRC --right=DEST [--remember=file]

          compare_files will output items in LEFT that are not in RIGHT"

          Example:
          Remember files from SRC, and output new files since command was
          last run.

              compare_files --left=SRC --right=seen.txt --remember=seen.txt


        BANNER

        opts.summary_width = 20

        opts.on("--left=LEFT", "Required. Source side to compare against. May be a folder, or text file.") do |op|
          args.left = op
        end

        opts.on("--right=RIGHT", "Required. Destination side to compare against. May be a folder, or text file.") do |op|
          args.right = op
        end

        opts.on("--remember=FILE", "Save value of LEFT option to FILE. Useful for comparing SRC to itself through time.") do |op|
          pn = Pathname.new(op)
          valid_file_name = (pn.exist? && pn.file?) || !pn.exist?
          raise Error, "Invalid file name #{op}" unless valid_file_name
          args.remember = op
        end

        opts.on("-h", "--help", "Prints this help") do
          puts opts
          exit
        end

        opts.on("-v", "--version", "Prints the version (#{VERSION})") do
          puts VERSION
          exit
        end
      end

      opt_parser.parse!
      # verify we got the right combos
      valid_args = false
      valid_args = true if args.left && args.left
      unless valid_args
        puts "Missing required options.\n\n"
        puts opt_parser
        exit 1
      end

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

      when input.is_a?(String)
        pn = Pathname.new(input)
        file_as_str = if pn.exist?
          File.open(input) do |file|
            file.read
          end
        else
          FileUtils.touch(input)
          ''
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
