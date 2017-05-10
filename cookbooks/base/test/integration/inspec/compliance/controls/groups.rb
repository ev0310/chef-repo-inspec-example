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


# Set default attribute
admin_users = attribute(
  'admin_users',
  description: 'List of users that should be admins',
  default: ['tom']
)

control 'groups-2' do
  impact 1.0
  title 'Ensure only appropriate members of wheel group'
  desc '
    Ensure the wheel group only contains agreed upon members.
  '

  tag 'users', 'groups'
  ref 'Compliance: Host Access', url: 'https://wiki.example.com/security/compliance/ops/Host+Access+And+Permissions'

  describe users.where { groups.include?('wheel')  && ! admin_users.include?(username) } do
    its('entries.length') { should eq 0 }
  end
end

