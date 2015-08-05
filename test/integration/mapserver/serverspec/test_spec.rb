require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/usr/local/bin/alfred-json') do
  it { should exist }
  it { should be_executable }
end

describe cron do 
  it { should have_entry '* * * * * /opt/ffmap-backend/backend.py -d /srv/ffmap-data -p 14' }
end

describe port(80) do
  it { should be_listening.with('tcp6') }
end

describe port(443) do
  it { should be_listening.with('tcp6') }
end