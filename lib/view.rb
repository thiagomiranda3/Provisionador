# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class View

  def iniciar
    opcoes = Array.new

    puts "Digite o IP do XenServer:"
    print "==> "
    xs_ip = gets.chomp

    puts "Digite a senha de root:"
    print "==> "
    xs_pass = gets.chomp

    opcoes.push(xs_ip)
    opcoes.push(xs_pass)

    return opcoes
  end

  def menu
    puts "  1 - Criar nova máquina virtual"
    puts "  2 - Listar Máquinas Ativas"
    puts "  3 - Sair"
    print "  ==> "
    opcao = gets.chomp
    return opcao
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

  def limprovision
    puts "Digite o número de acessos por segundo do site"
    print "==> "
    opcao = gets.chomp
    return opcao
  end
end

