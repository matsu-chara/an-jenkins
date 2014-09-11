require 'spec_helper'

describe command('/usr/local/bin/python3 --version') do
    it { should return_exit_status 0 }
    it { should return_stderr(/Python 3.3/) }
end

describe command('/usr/local/bin/pip3 -V') do
    it { should return_exit_status 0 }
    it { should return_stdout(/pip 1.[0-9]+/) }
end
