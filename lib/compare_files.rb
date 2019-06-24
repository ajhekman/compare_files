require 'fileutils'
require 'pathname'
require "compare_files/version"

Dir[File.dirname(__FILE__)+'/**/*.rb'].each { |file| require file }
module CompareFiles
  class Error < StandardError; end
  # Your code goes here...
end
