require 'spec_helper'

describe file('/usr/local/lib/python3.3/site-packages/requests') do
  it { should be_file }
end
