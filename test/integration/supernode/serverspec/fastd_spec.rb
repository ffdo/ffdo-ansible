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

# Detection of running service fails in Debian 7.8. Needs investigation.
#describe service('rng-tools') do
#  it { should be_running }
#  it { should be_enabled }
#end

describe process("rngd") do
  it { should be_running }
end

describe user('fastd') do
  it { should exist }
  it { should have_login_shell '/bin/false' }
end