require 'serverspec'

describe package('batctl') do
  it {should be_installed }
end

describe kernel_module('batman_adv') do
  it { should be_loaded }
end