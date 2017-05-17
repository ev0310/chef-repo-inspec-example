# nginx base spec

control 'spec-base-1' do
  impact 1.0
  title 'nginx running and listening.'
  desc 'Ensure service is running and listening'

  describe service('nginx') do
    it { should be_running }
  end

  # Need to figure out how to get network facing IP.
  describe host('127.0.0.1', port: 443, proto: 'tcp') do
    it { should be_reachable }
  end

end

