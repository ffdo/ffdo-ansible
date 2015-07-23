require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('fastd') do
  it { should be_installed }
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

describe file('/etc/fastd/test') do
  it { should exist }
  it { should be_directory }
end

describe file('/etc/fastd/test/fastd.conf') do
  it { should exist }
  it { should be_file }
end

describe file('/etc/fastd/test/secret.conf') do
  it { should exist }
  it { should be_file }
  its(:content) { should contain 'secret "some secret";' }
end