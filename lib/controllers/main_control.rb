module Escalonador
  class MainControl

    def initialize
      @main_view = MainView.new
      @connection_control = ConnectionControl.new
      @provision = ProvisionControl.new

      make_connection
    end

    private

    def showmenu
      opcao = @main_view.menu
      case opcao
        when "1"
          @provision.provisionar
        when "2"
          @conn = @connection_control.initiate_connection
        when "3"
          exit
        else
          puts "Opção inválida"
      end
    end

    def make_connection
      ### Conectando ao XenServer
      @conn = @connection_control.initiate_connection

      ### Menu de Provisionamento
      while (1)
        @provision.set_conn(@conn)
        showmenu
      end
    end

  end
end