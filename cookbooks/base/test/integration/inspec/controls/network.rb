# Check open ports
#

default_allowed_ports = attribute(
  'base_compliance_allowed_ports',
  description: 'List of allowed ports',
  default: []
)

service_allowed_ports = attribute(
  'service_compliance_allowed_ports',
  description: 'List of allowed ports for a service.',
  default: []
)

allowed_ports = default_allowed_ports + service_allowed_ports

control 'network-1' do
  impact 0.8
  title 'Ensure only allowed ports are network accessible'
  desc '
    Only allowed ports should be network accessible.
  '

  tag 'network'
  ref 'Compliance: Network Accessibility', url: 'https://wiki.example.com/security/compliance/ops/Network+Accessibility'

  # Get list of non locally bound ports.
  #
  # XXX: We shoudl be checking IPv6.
  ports = command('netstat -ant -A inet | tail -n +3 | awk \'{print $4}\' | grep -v 127.0.0.1 | cut -d : -f 2').stdout.strip.lines.sort!.uniq!

  int_ports = ports.map { |i| i.to_i }
  (int_ports - allowed_ports).each do |p|
    describe port(p) do
      it { should_not be_listening }
    end
  end
end


