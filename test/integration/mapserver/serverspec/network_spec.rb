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