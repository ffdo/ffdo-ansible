require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/usr/local/bin/alfred-json') do
  it { should be_file }
  it { should be_readable }
  it { should be_executable }
end