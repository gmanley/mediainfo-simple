$:.unshift(File.expand_path('../../lib', __FILE__), File.dirname(__FILE__))
require 'mediainfo-simple'
require 'rspec'

def load_fixture(name)
  File.read(File.join(File.dirname(__FILE__), 'fixtures', name))
end