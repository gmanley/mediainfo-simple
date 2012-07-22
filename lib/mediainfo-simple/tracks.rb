module Mediainfo
  class Tracks
    module Generic
      include Virtus

      attribute :duration, Integer

      def duration=(duration_string)
        duration_string.match(/((?<h>\d+)h )?((?<m>\d+)mn )?((?<s>\d+)s)?/) do |match|
          self[:duration] = ((match[:h].to_i || 0) * 60 * 60) + ((match[:m].to_i || 0) * 60) + match[:s].to_i
        end
      end
    end

    class General
      include Generic
    end

    class Video
      include Generic
    end

    class Audio
      include Generic
    end
  end
end