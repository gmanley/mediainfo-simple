require 'shellwords'

module Mediainfo
  class Parser

    def initialize(file)
      @file = file
    end

    def parsed_response
      @parsed_response ||= Nori.parse(xml_response)[:mediainfo][:file]
    rescue
      raise InvalidFileError
    end

    private
    def xml_response
      @xml_response ||= %x[mediainfo #{@file.shellescape} --Output=XML]
    end
  end
end