require 'fog'

class Main
  conn = Fog::Compute.new({
      :provider => 'XenServer',
      :xenserver_url => '192.168.10.4',
      :xenserver_username => 'root',
      :xenserver_password => 'regexp1301',
    })

  "oi".gsub(pattern, replacement) { |match|  }

  conn.servers.each do |vm|
    if vm.tools_installed?
      vm.guest_metrics.networks.each do |k,v|
        puts v
      end
    end
  end
end