require 'spec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(80) do
  it { should be_listening }
end

describe port(8080) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end

describe command('/usr/sbin/nginx -v') do
    it { should return_exit_status 0 }
    it { should return_stderr(/nginx version: nginx\/1.[0-9]+.[0-9]+/) }
end

describe file('/etc/nginx/conf.d/default.conf') do
  it { should be_file }
  its(:content) { should match(/root   \/var\/www\/html;/) }
end

describe file('/etc/nginx/conf.d/virtual.conf') do
  it { should be_file }
end

describe file('/etc/nginx/ssl') do
  it { should be_directory }
end

describe file('/etc/nginx/.htpasswd') do
  it { should be_file }
end
