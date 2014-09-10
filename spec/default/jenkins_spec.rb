require 'spec_helper'

describe package('jenkins') do
  it { should be_installed }
end

describe service('jenkins') do
  it { should be_enabled   }
  it { should be_running   }
end

describe file('/etc/sysconfig/jenkins') do
  it { should be_file }
  its(:content) { should match(/JENKINS_ARGS="--prefix=\/jenkins --httpPort=\$\{JENKINS_PORT\} --ajp13Port=\$\{JENKINS_AJP_PORT\}"/) }
end
