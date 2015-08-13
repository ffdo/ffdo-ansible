require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/usr/local/sbin/alfred') do
  it { should exist }
  it { should be_executable }
end

describe file('/usr/local/sbin/alfred-gpsd') do
  it { should exist }
  it { should be_executable }
end

describe file('/usr/local/sbin/batadv-vis') do
  it { should exist }
  it { should be_executable }
end