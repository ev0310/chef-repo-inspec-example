# chef-repo-inspec-example
Example chef repository to show [Chef InSpec](https://www.inspec.io/) usage.

## InSpec
All cookbooks should have an InSpec profile for them.  The policy should contain both spec tests and compliance tests.  Spec tests are written to ensure that a host is configured and functions in a certain way.  Compliance tests should (in our repository) should ensure that a host is not configured improperly.

* spec test: A service is running and responsive over HTTPS.
* compliance test: HTTPS is not using week ciphers

### Setup
Inspec is included in the ChefDK or can alternatively be installed using the repository's Gemfile.  Once installed, initialize a profile for a cookbook.  from the root of this repository:

```
$ inspec init profile cookbooks/[cookbook]/test/integration/inspec
Create new profile at /Users/tmclaughlin/Source/threatstack/chef-repo-inspec-example/cookbooks/base/tests/integration/inspec
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
```

## Chef Repo
This repository uses wrapper style cookbooks to set default attributes on cookbooks obtained via the Chef Supermarket.  All services should have a role defined for it as well as a cookbook.  The `run_list` for the role should be:
* recipe[base]
* recipe[$SERVICE_COOKBOOK]

Cookbook creation
```
$ cd cookbooks
$ chef generate cookbook site-{SERVICE} -C "Threat Stack, Inc" -m you@threatstack.com -I mit
```
