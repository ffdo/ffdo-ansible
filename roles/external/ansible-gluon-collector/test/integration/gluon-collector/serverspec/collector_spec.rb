require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/opt/gluon-collector') do
  it { should be_directory }
end

describe file('/opt/gluon-collector/gluon-collector') do 
  it { should exist }
  it { should be_file }
  it { should be_executable }
end