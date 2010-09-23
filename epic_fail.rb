require 'webmock'
require 'vcr'
require 'mechanize'

class EpicFail
  def self.prepare_for_fail
    VCR.config do |c|
      c.cassette_library_dir = 'test/fakeweb'
      c.http_stubbing_library = :webmock
    end
  end

  def self.what_a_fail
    WebMock.allow_net_connect!
    url = 'http://www.wp.pl'
    Nokogiri::HTML(Mechanize.new.get(url).content)
  end
end
