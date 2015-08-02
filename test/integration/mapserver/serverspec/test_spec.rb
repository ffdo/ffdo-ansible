require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/usr/local/bin/alfred-json') do
  it { should exist }
  it { should be_executable }
end