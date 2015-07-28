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

describe interface('tap00') do
  it { should exist }
end

describe interface('tap01') do
  it { should exist }
end

describe interface('node02') do
  it { should exist }
end

describe interface('uplink1') do
  it { should exist }
end