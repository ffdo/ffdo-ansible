require 'serverspec'

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