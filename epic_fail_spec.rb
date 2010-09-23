require 'epic_fail'

describe EpicFail, '#what_a_fail' do
  before do
    @epic = EpicFail
    @epic.prepare_for_fail
  end

  it 'will raise IOError: Net::HTTPOK#read_body called twice' do
    lambda{@epic.what_a_fail}.should raise_error()
  end
end
