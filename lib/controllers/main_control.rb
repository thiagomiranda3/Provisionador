module Escalonador
  class MainControl

    def initialize
      @main_view = MainView.new
      @connection_control = ConnectionControl.new
      @provision = ProvisionControl.new
      ### Conectando ao XenServer
      @conn = @connection_control.initiate_connection

      ### Menu de Provisionamento
      @provision.set_conn(@conn)
      showmenu
    end

    private

    def showmenu
      opcao = @main_view.menu
      case opcao
        when "1"
          @provision.provisionar
        when "2"
          puts "Máquinas Ativas no XenServer"
        when "3"
          exit
        else
          puts "Opção inválida"
      end
    end

  end
end