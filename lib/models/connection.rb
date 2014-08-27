require 'fog'

class Connection

  def initialize
    @main_view = MainView.new
  end

  def open_connection(xs_ip, xs_pass)
    puts 'Conectando...'
    begin
      @conn = Fog::Compute.new({
                                   provider: 'XenServer',
                                   xenserver_url: xs_ip,
                                   xenserver_username: 'root',
                                   xenserver_password: xs_pass,
                               })
      puts "\nConectado com sucesso!"
    rescue
      puts 'Dados inválidos para estabelecer conexão!'
      raise
    end
    return @conn
  end

  def getconn()
    return @conn
  end
end