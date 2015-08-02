require 'serverspec'

describe interface('meshdummy0') do
  it { should exist }
end

describe interface('alfred0') do
  it { should exist }
end

describe interface('bat0') do
  it { should exist }
end

describe interface('eth0') do
  it { should exist }
end

describe package('bird') do
  it { should be_installed }
end

# At least on Ubuntu doesn't open a port. Is this a problem?
describe port(179) do 
  it { should be_listening.with('tcp') }
  it { should be_listening.with('tcp6') }
end

describe process('bird') do
  it { should be_running }
end

describe process('bird6') do
  it { should be_running }
end