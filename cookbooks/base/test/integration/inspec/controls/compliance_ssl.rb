# Test SSL

is_vagrant = attribute(
  'is_vagrant',
  description: 'If running under Vagrant',
  default: false
)

if is_vagrant != true
  # Doesn't work in Vagrant. :(
  include_controls 'ssl-baseline'
end

