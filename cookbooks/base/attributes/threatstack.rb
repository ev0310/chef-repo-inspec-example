default['threatstack']['version'] = nil
default['threatstack']['rulesets'] = []

# You can set the deploy key directly, or use the encrypted databag
# parameters below. The value searched for will be 'deploy_key'
default['threatstack']['deploy_key'] = nil

# Threat Stack feature plan.  Valid string values:
# * investigate: Investigate package
# * monitor: Monitor package
# * legacy: Legacy Basic, Pro, Advanced packages
#
# See: https://www.threatstack.com/plans
default['threatstack']['feature_plan'] = 'investigate'

# Control the configuration of the Threat Stack agent.  Useful when installing
# agent into images.
default['threatstack']['configure_agent'] = true
