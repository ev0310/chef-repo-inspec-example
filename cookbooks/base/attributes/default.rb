# We opt to provide troubleshooting tools on hosts because our customers don't
# care that we've don't allow people on hosts, they care that stuff works.
default['base']['packages'] = [
  'curl',
  'iftop',
  'iptraf',
  'htop',
  'lsof',
  'tcpdump',
  'tmux',
  'vim-minimal',
]
