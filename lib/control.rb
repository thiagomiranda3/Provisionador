require 'fog'
require File.dirname(__FILE__) + '/view'

class Control

  def initialize
    @conn = Fog::Compute::XenServer::Real
    @objview = View.new
  end

  def connect(xs_ip, xs_pass)
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
  end

  def getconn()
    return @conn
  end

  def showmenu
    opcao = @objview.menu
    puts opcao
      case opcao
        when "1"
          num_acessos = @objview.limprovision
          num_memory = define_memory(num_acessos)
          num_vcpu = define_vcpu(num_acessos)
          provisionar(num_memory, num_vcpu)
        when "2"
          puts "Máquinas Ativas no XenServer"
        when "3"
          exit
        else
          puts "Opção inválida"
      end
  end

  private

  def provisionar(mem, vcpu)
    static_min_mem = 128
    static_max_mem = 128
    dinamic_min_mem = mem
    dinamic_max_mem = mem

    puts "Configurando Rede..."
    net = @conn.networks.find { |n| n.name == "Host internal management network" }
    puts "Preparando Disco..."
    sr = @conn.storage_repositories.find { |sr| sr.name == 'Local storage' }
    puts "Provisionando Máquina..."
    vm = @conn.servers.new :name => "server" + SecureRandom.hex(10),
                           :template_name => "Debian_Test",
                           :networks => [net]
    vm.save
    puts "Máquina criado com Sucesso"
  end

  def define_memory(acessos)
    return 0
  end

  def define_vcpu(acessos)
    return 0
  end
end