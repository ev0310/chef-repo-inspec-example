control 'groups-1' do
  impact 0.4
  title 'Ensure necessary groups exist'
  desc '
    Make sure the wheel (admin) and users group exist on this host.  All user
    accounts should be added to users.  All users should be a member of users.
    All admin users should be additionally a member of wheel.
  '

  tag 'users', 'groups'
  ref 'Compliance: Host Access', url: 'https://wiki.example.com/security/compliance/ops/Host+Access+And+Permissions'

  describe group('users') do
    it {should exist}
  end
  describe group('wheel') do
    it {should exist}
  end
end

