module Escalonador
  class MainView

    def menu
      puts "\n  1 - Criar nova máquina virtual"
      puts "  2 - Conectar em Outro Servidor"
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

end