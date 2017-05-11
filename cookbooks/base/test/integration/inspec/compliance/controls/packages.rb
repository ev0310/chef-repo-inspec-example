control 'packages-1' do
  impact 0.8
  title 'Ensure all repos have gpg checking enabled'
  desc '
    All yum repositories should have package checking enabled.
  '

  tag 'packages'
  ref 'Compliance: Host Access', url: 'https://wiki.example.com/security/compliance/ops/Software+Security'

  # XXX: using 'should_not' we ensure that no repo has had gpgcheck disabled
  # if there are multiple defined in a single file.  We really shouldn't have
  # unmanaged repo files anyways and have purged the CentOS-*.repo files and
  # replaced them with chef managed resources which would solve this problem.
  files = command('ls /etc/yum.repos.d/*.repo').stdout.strip.lines
  files.each do |f|
    describe file(f.strip) do
      its('content') { should_not match /gpgcheck=0/ }
    end
  end
end

