module Escalonador
  class ProvisionControl

    def initialize
      @provision = Provision.new
      @main_view = ProvisionView.new
    end

    def set_conn(obj_conn)
      @provision.set_conn(obj_conn)
    end

    def provisionar
      acessos = num_acessos
      num_memory = define_memory(acessos.to_i)
      num_vcpu = define_vcpu(acessos.to_i)
      if num_memory == -1 || num_vcpu == -1
        puts "Servidor não suporta esse número de acessos"
      else
        @provision.provisionar(num_memory, num_vcpu)
      end
    end

    private

    def num_acessos
      @main_view.menu_acessos
    end

    def define_memory(num_acessos)
      if num_acessos < 9
        return 512
      elsif num_acessos <= 17 && num_acessos >= 9
        return 27.6669*Math::E**(0.32702*num_acessos)
      elsif num_acessos <= 36 && num_acessos >= 18
        return 39.9929*Math::E**(0.142771*num_acessos)
      elsif num_acessos <= 53 && num_acessos >= 37
        return 1.39896*Math::E**(0.159945*num_acessos)
      elsif num_acessos <= 70 && num_acessos >= 54
        return 0.104909*Math::E**(0.157865*num_acessos)
      else
        return -1
      end
    end

    def define_vcpu(num_acessos)
      if num_acessos < 9
        return 1
      elsif num_acessos <= 17 && num_acessos >= 9
        return 1
      elsif num_acessos <= 36 && num_acessos >= 18
        return 2
      elsif num_acessos <= 53 && num_acessos >= 37
        return 3
      elsif num_acessos <= 70 && num_acessos >= 54
        return 4
      else
        return -1
      end
    end

  end
end