require 'spec_helper'

describe iptables do
  it { should have_rule('-P INPUT DROP') }
  it { should have_rule('-P FORWARD DROP') }
  it { should have_rule('-P OUTPUT ACCEPT') }
  it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT') }
  it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT') }
  it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT') }
  it { should_not have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 8080 -j ACCEPT') }
end
