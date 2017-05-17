# Set default attribute
admin_users = attribute(
  'base_compliance_admin_users',
  description: 'List of users that should be admins',
  default: []
)

control 'compliance-groups-1' do
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

