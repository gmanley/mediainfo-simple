require 'spec_helper'

describe Mediainfo::Parser do

  context 'with a video file containing one audio and video track' do
    before do
      @parser = Mediainfo::Parser.new("/Users/gray/Movies/Chappelle's Show/Season 02/01.avi")
      @parser.stub(xml_response: load_fixture('1.xml'))
    end

    describe '#parsed_response' do
      subject { @parser.parsed_response }

      it { should be_kind_of(Mediainfo::ParsedResponse) }

      it { should respond_to(:video, :audio, :general) }

      describe '#video' do

        it { should respond_to(:duration) }
      end
    end
  end
end
