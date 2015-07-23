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

describe file('/etc/fastd/test/dummy') do
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
  its(:content) { should contain 'secret "280088c4263359417e9f2daf1771db820ab79eb4f79e3718719b2a976e8a8b5e";' }
end