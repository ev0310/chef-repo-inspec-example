source 'https://supermarket.getchef.com'

# Find all our cookbooks by selecting every directory name except those that
# start with "."
Dir.entries('cookbooks/').reject {
  |o| not File.directory?("cookbooks/#{o}") or "#{o}".start_with?('.')
}.each do |cb|
  cookbook cb, path: "cookbooks/#{cb}"
end
