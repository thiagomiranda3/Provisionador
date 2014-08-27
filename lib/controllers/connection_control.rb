require File.dirname(__FILE__) + '/../models/connection'
require File.dirname(__FILE__) + '/../views/connection_view'

class ConnectionControl

  def initialize
    @connection = ::Connection.new
    @main_view = ConnectionView.new
  end

  def initiate_connection
    try_n = 1
    opcoes = Array.new

    begin
      opcoes = @main_view.iniciar()
      sleep(1)
      conn = @connection.open_connection(opcoes[0], opcoes[1])
    rescue
      if try_n != 3
        try_n += 1
        retry
      else
        puts "\nNenhuma tentativa de acesso foi concluida!"
        puts "Fechando..."
        exit
      end
    end

    return conn
  end
end