require 'shellwords'

require 'mediainfo-simple/tracks'

module Mediainfo
  class ParsedResponse
    include Virtus

    attribute :general, Array[Tracks::General]
    attribute :video,   Array[Tracks::Video]
    attribute :audio,   Array[Tracks::Audio]

    def initialize(tracks)
      attributes_hash = {}

      tracks.each do |track|
        attribute_name = track.delete(:type).to_sym

        unless Tracks.const_defined?(attribute_name)
          attribute attribute_name.downcase, Array[Tracks::Generic]
        end

        attributes_hash[attribute_name.downcase] ||= [] << track
      end

      self.attributes = attributes_hash
    end
  end

  class Parser

    def initialize(file)
      @file = file
    end

    def parsed_response
      ParsedResponse.new(raw_hash_response[:track])
    end

    private
    def raw_hash_response
      @raw_hash_response ||= Nori.parse(xml_response)[:mediainfo][:file]
    end

    def xml_response
      @xml_response ||= %x[mediainfo #{@file.shellescape} --Output=XML]
    end
  end
end