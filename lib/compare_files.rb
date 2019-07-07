require 'fileutils'
require 'pathname'
require "compare_files/version"

Dir[File.dirname(__FILE__)+'/**/*.rb'].each { |file| require file }
module CompareFiles
  class Error < StandardError; end
  # Your code goes here...

  def self.new_left(left, right)
    DiffTools.new_left(
      Cli.standardize_input(left),
      Cli.standardize_input(right),
    )
  end
end
