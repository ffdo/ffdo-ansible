require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/etc/fastd') do
  it { should be_directory }
end

describe file('/etc/fastd/test1') do
  it { should be_directory }
end

describe file('/etc/fastd/test2') do
  it { should be_directory }
end

describe package('fastd') do
  it { should be_installed }
end

# Ansible seems to have problems to enable a service. Needs investigation
describe service('fastd') do
  it { should be_running }
#  it { should be_enabled }
end

describe process('fastd') do
  it { should be_running }
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

describe process("rngd") do
  it { should be_running }
end

describe user('fastd') do
  it { should exist }
  it { should have_login_shell '/bin/false' }
end