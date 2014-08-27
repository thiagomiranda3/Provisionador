class ConnectionView

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
end