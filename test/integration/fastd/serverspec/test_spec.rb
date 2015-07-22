require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('fastd') do
  it { should be_installed }
end