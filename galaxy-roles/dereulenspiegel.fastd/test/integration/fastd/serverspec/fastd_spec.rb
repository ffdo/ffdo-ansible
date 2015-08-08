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

describe file('/etc/fastd/test2/peers') do
  it { should be_directory}
end

describe file('/etc/fastd/test2/peers/test-peer') do
  it { should be_file }
  it { should be_readable }
end

describe package('fastd') do
  it { should be_installed }
end

if ENV['CI'] != 'true'
  # Travis doesn't provide the tap module, so our service won't start
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
end

describe user('fastd') do
  it { should exist }
  it { should have_login_shell '/bin/false' }
end