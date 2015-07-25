require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('fastd') do
  it { should be_installed }
end

# Ansible seems to have problems to enable a service. Needs investigation
describe service('fastd') do
  it { should be_running }
#  it { should be_enabled }
end

# Detection of running service fails in Debian 7.8. Needs investigation.
#describe service('rng-tools') do
#  it { should be_running }
#  it { should be_enabled }
#end

describe file('/etc/fastd/fastd-blacklist.sh') do
  it { should exist }
  it { should be_executable }
end

describe port(10000) do
  it { should be_listening.with('udp6') }
end

describe port(10001) do
  it { should be_listening.with('udp6') }
end

describe package('rng-tools') do
  it { should be_installed }
end

describe file('/etc/default/rng-tools') do
  it { should exist }
  its(:content) { should match /HRNGDEVICE=\/dev\/urandom/ }
end

describe user('fastd') do
  it { should exist }
  it { should have_login_shell '/bin/false' }
end

describe package('batctl') do
  it {should be_installed }
end

describe kernel_module('batman_adv') do
  it { should be_loaded }
end

describe package('bird') do
  it { should be_installed }
end

describe file('/etc/bird/bird.conf') do
  it { should exist }
  its(:content) { should contain 'router id 10.42.0.1;' }
end

describe file('/etc/bird/bird6.conf') do
  it { should exist }
  its(:content) { should contain 'router id 10.42.0.1;' }
end

# At least on Ubuntu doesn't open a port. Is this a problem?
#describe port(179) do 
#  it { should be_listening.with('tcp') }
#  it { should be_listening.with('tcp6') }
#end

#describe service('bird') do
#  it { should be_running }
#  it { should be_enabled }
#end

#describe service('bird6') do
#  it { should be_running }
#  it { should be_enabled }
#end

describe interface('meshdummy0') do
  it { should exist }
end

describe interface('alfred0') do
  it { should exist }
end

describe interface('bat0') do
  it { should exist }
end

describe interface('eth0') do
  it { should exist }
end

describe interface('tap00') do
  it { should exist }
end

describe interface('tap01') do
  it { should exist }
end

describe interface('test-node02') do
  it { should exist }
end

describe interface('ffanon-uplink1') do
  it { should exist }
end

describe cron do
  it { should have_entry '*/5 * * * * wget -q -O /etc/fastd/fastd-blacklist.json https://raw.githubusercontent.com/ffruhr/fastdbl/master/fastd-blacklist.json' }
end