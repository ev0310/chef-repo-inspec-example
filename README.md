# chef-repo-inspec-example
Example chef repository to show [Chef InSpec](https://www.inspec.io/) usage.

## InSpec
All cookbooks should have at least a compliance InSpec profile for them.  The policy should test for what needs to be tested and for desired outcomes only.  That means the policy doesn't necessarily have to test for what is written in the cookbook but for what we want to happen or don't want to happen.  For example, we might test that only a certain set of users are a member of the _wheel_ group.  We might also test SSL/TLS configuration not for specific encryption ciphers but for a lack of disallowed ciphers.

Remember, the compliance profile tests are for compliance / test-driven security and not not test-driven development.

### Setup
Inspec is included in the ChefDK or can alternatively be installed using the repository's Gemfile.  Once installed, initialize a profile for a cookbook.  from the root of this repository:

```
$ inspec init profile cookbooks/[cookbook]/test/integration/inspec/compliance
Create new profile at /Users/tmclaughlin/Source/threatstack/chef-repo-inspec-example/cookbooks/base/tests/integration/inspec/compliance
 * Create directory controls
 * Create file controls/example.rb
 * Create file inspec.yml
 * Create directory libraries
 * Create file README.md
 * Create file libraries/.gitkeep

$ rm controls/example.rb  # unnecessary file
```

While a single cookbook can have multiple InSpec profiles we create only one and all tests should live within that profile.  Start off by editing the _inspec.yaml_ file.  This is an example _inspec.yaml_ for this repositories _base_ cookbook.

```yaml
name: base-compliance
title: Base Compliance
maintainer: Tom McLaughlin
copyright: Threat Stack, Inc
copyright_email: tom.mclaughlin@threatstack.com
license: MIT
summary: Base OS Compliance Profile
version: 0.1.0
```

With the profile metadata written start adding compliance tests under the _controls/_ directory.  Use multiple files to reflect what is being tested.  Ideally the file names should correspond with recipe names to make tracking down the configuring resource easier.  A test file may have more than one control in it.

controls/groups.rb
```ruby
control 'groups-1' do
  impact 1.0
  title 'GROUPS: Ensure necessary groups exist'
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
  describe group('wheels') do
    it {should exist}
  end
end
```

