# encoding: utf-8
# copyright: 2015, The Authors
# license: All rights reserved

# you add controls here
control 'base-1' do
  impact 1.0
  title 'service listening on port 443'
  desc 'Ensure something is listening on port 443'
  # Need to figure out how to get network facing IP.
  describe host('127.0.0.1', port: 443, proto: 'tcp') do
    it { should be_reachable }
  end

  # Is vagrant or not
  is_vagrant = command('hostname').stdout.split('.')[1] == 'vagrantup' || false

  # See http resource doc and why we do not use that instead of a command
  # resource below.
  #
  # XXX: MAKE SURE YOU HAVE SET ROLE OR THIS TEST WILL F UP!!!!!!
  # - tom (after a few hours debugging this)
  describe json({:command => 'curl -s -k https://127.0.0.1/threatstack-to-s3/api/v1/s3/status'}) do
    if is_vagrant
      its('success') { should eq false }
    else
      its('success') { should eq true }
    end
  end
end
