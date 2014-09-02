module Escalonador
  class Provision

    def set_conn(obj_conn)
      @conn = obj_conn
    end

    def provisionar(mem, vcpu)
      #static_min_mem = (128*1024*1024)
      #static_max_mem = (mem*1024*1024)
      #dinamic_min_mem = (128*1024*1024)
      #dinamic_max_mem = (mem*1024*1024)

      puts "Configurando Rede..."
      @net = @conn.networks.find { |n| n.name == "Host internal management network" }
      puts "Preparando Disco..."
      @sr = @conn.storage_repositories.find { |sr| sr.name == 'Local storage' }
      puts "Provisionando Máquina..."
      @vm = @conn.servers.new :name => "server" + SecureRandom.hex(10),
                              :template_name => "Debian_Test",
                              :networks => [@net]
      @vm.save :auto_start => false
      @vm.provision
      puts "Máquina criado com Sucesso"
    end

    def define_memory(acessos)
      return 0
    end

    def define_vcpu(acessos)
      return 0
    end
  end
end