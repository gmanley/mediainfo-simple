require 'spec_helper'

describe Mediainfo::Parser do

  before do
    @parser = Mediainfo.parse("/Users/gray/Movies/Chappelle's Show/Season 02/01.avi")
    @parser.stub(xml_response: load_fixture('1.xml'))
  end


  describe '#parsed_response' do

    it 'should be a hash' do
      @parser.parsed_response.should be_kind_of(Hash)
    end
  end
end
