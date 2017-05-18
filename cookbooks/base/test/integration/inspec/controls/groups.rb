admin_users = attribute(
  'base_compliance_admin_users',
  description: 'List of users that should be admins',
  default: []
)

control 'groups-1' do
  impact 0.4
  title 'Ensure necessary groups exist'
  desc '
    Make sure the wheel (admin) and users group exist on this host.  All user
    accounts should be added to users.  All users should be a member of users.
    All admin users should be additionally a member of wheel.
  '

  tag 'users', 'groups'

  describe group('users') do
    it {should exist}
  end
  describe group('wheel') do
    it {should exist}
  end
end

control 'users-1' do
  impact 0.6
  title 'Ensure admin users have been created'
  desc 'All admin users must be present on the system.'
  tag 'users', 'groups'

  admin_users.each do |u|
    describe user(u) do
      it { should exist }
      its('groups') { should include 'wheel' }
    end
  end
end

