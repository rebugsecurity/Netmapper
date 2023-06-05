require 'net/ping'

def scan_network(ip_range)
  reachable_hosts = []

  ip_range.each do |ip|
    ping = Net::Ping::TCP.new(ip)
    reachable_hosts << ip if ping.ping?
  end

  reachable_hosts
end

def print_network_map(reachable_hosts)
  puts "Network Map:"
  puts "-------------"
  reachable_hosts.each_with_index do |host, index|
    puts "#{index + 1}. #{host}"
  end
end

# Define the IP range to scan
ip_range = ['192.168.1.1', '192.168.1.2', '192.168.1.3', '192.168.1.4']

# Scan the network
reachable_hosts = scan_network(ip_range)

# Print the network map
print_network_map(reachable_hosts)