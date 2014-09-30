module Escalonador
  class Provision

    def set_conn(obj_conn)
      @conn = obj_conn
    end

    def provisionar(mem, vcpu)
      memory_max_temp = (mem*1024*1024)
      memory_min_temp = (512*1024*1024)
      vcpu_value_temp = vcpu

      memory_max = memory_max_temp.round(0).to_s
      memory_min = memory_min_temp.round(0).to_s
      vcpu_value = vcpu_value_temp.to_s

      puts "Configurando Rede..."
      @net = @conn.networks.find { |n| n.name == "Host internal management network" }
      puts "Preparando Disco..."
      @sr = @conn.storage_repositories.find { |sr| sr.name == 'Local storage' }
      puts "Provisionando Máquina..."
      @vm = @conn.servers.new :name => "server" + SecureRandom.hex(10),
                              :template_name => "debian_client",
                              :networks => [@net]
      @vm.save :auto_start => false
      @vm.set_attribute("memory_static_max",memory_max)
      @vm.set_attribute("memory_dynamic_max",memory_max)
      @vm.set_attribute("memory_dynamic_min",memory_min)
      @vm.set_attribute("memory_static_min",memory_min)
      @vm.set_attribute("VCPUs_max",vcpu_value)
      @vm.set_attribute("VCPUs_at_startup",vcpu_value)

      @vm.provision
      @vm.start
      puts "Máquina criada com Sucesso!"
    end

    def define_memory(acessos)
      puts 174.5445*Math.log(x,Math::E)-854.025
      return 0
    end

    def define_vcpu(acessos)
      return 0
    end
  end
end