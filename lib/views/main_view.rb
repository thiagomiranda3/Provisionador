# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class MainView

  def menu
    puts "\n  1 - Criar nova máquina virtual"
    puts "  2 - Listar Máquinas Ativas"
    puts "  3 - Sair"
    print "  ==> "
    gets.chomp
  end

  def showips(conn)
    conn.servers.each do |vm|
      if vm.tools_installed?
        vm.guest_metrics.networks.each do |k, v|
          puts v
        end
      end
    end
  end


end

