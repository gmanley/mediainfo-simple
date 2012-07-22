require 'nori'
require 'virtus'

$:.unshift(File.dirname(__FILE__))
require 'mediainfo-simple/parser'

module Mediainfo
  MEDIAINFO_CLI = 'mediainfo'

  Nori.configure do |config|
    config.convert_tags_to { |tag| tag.snakecase.gsub(/_+/, '_').gsub(/@|_$/, '').to_sym }
  end

  def self.parse(file)
    Parser.new(file).parsed_response
  end

  class InvalidFileError < StandardError; end
end
