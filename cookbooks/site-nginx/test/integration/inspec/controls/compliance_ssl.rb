
cipher_list = command('openssl ciphers').stdout.strip.split(':')

control 'compliance-ssl-1' do
  impact 0.7
  title 'Disallowed SSL/TLS protocols'
  desc '
    Test for deprecated SSL/TLS protocols being enabled.
  '

  tag 'network'
  ref 'Compliance: Network Accessibility', url: 'https://wiki.example.com/security/compliance/ops/Network+Accessibility'

  describe command('openssl s_client -ssl2 -connect 127.0.0.1:443 < /dev/null') do
    its('exit_status') { should eq 1 }
  end
  describe command('openssl s_client -ssl3 -connect 127.0.0.1:443 < /dev/null') do
    its('exit_status') { should eq 1 }
  end

end

control 'compliance-ssl-2' do
  impact 0.7
  title 'Disallowed SSL/TLS ciphers'
  desc '
    Test for deprecated SSL/TLS protocols being enabled.
  '

  tag 'network'
  ref 'Compliance: Network Accessibility', url: 'https://wiki.example.com/security/compliance/ops/Network+Accessibility'

  cipher_list.select { |x| x =~ /DES/ }.each do |c|
    describe command("openssl s_client -cipher #{c} -connect 127.0.0.1:443 < /dev/null") do
      its('exit_status') { should eq 1 }
    end
  end

  cipher_list.select { |x| x =~ /MD5/ }.each do |c|
    describe command("openssl s_client -cipher #{c} -connect 127.0.0.1:443 < /dev/null") do
      its('exit_status') { should eq 1 }
    end
  end

  cipher_list.select { |x| x =~ /PSK/ }.each do |c|
    describe command("openssl s_client -cipher #{c} -connect 127.0.0.1:443 < /dev/null") do
      its('exit_status') { should eq 1 }
    end
  end

  cipher_list.select { |x| x =~ /RC4/ }.each do |c|
    describe command("openssl s_client -cipher #{c} -connect 127.0.0.1:443 < /dev/null") do
      its('exit_status') { should eq 1 }
    end
  end

  cipher_list.select { |x| x =~ /EXPORT/ }.each do |c|
    describe command("openssl s_client -cipher #{c} -connect 127.0.0.1:443 < /dev/null") do
      its('exit_status') { should eq 1 }
    end
  end

  cipher_list.select { |x| x =~ /NULL/ }.each do |c|
    describe command("openssl s_client -cipher #{c} -connect 127.0.0.1:443 < /dev/null") do
      its('exit_status') { should eq 1 }
    end
  end

end

