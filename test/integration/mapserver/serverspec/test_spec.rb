require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/usr/local/bin/alfred-json') do
  it { should exist }
  it { should be_executable }
end

describe cron do {
  it { should should have_entry '* * * * * /srv/ffmap-backend/backend.py -d /srv/ffmap-data -p 14' }
}

describe port(80) do
  it { should be_listening.with('tcp6') }
end

describe port(443) do
  it { should be_listeing.with('tcp6') }
end