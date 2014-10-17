module Escalonador
  class ProvisionControl

    def initialize
      @provision = Provision.new
      @main_view = ProvisionView.new
    end

    def set_conn(obj_conn)
      @provision.set_conn(obj_conn)
    end

    def read_file()
      arquivo = Array.new
      file = File.expand_path("../lib/equacoes.txt")
      File.open(file, "r") do |file|
        cpus = file.readline()
        file.each_line { |line|
          arquivo << line.split.map(&:to_f)
        }
      end
      return arquivo
    end

    def provisionar
      acessos = num_acessos
      recursos = define_resources(acessos.to_i)
      num_memory = recursos[0]
      num_vcpu = recursos[1]
      if recursos[0] == -1 || recursos[1] == -1
        puts "Servidor não suporta esse número de acessos"
      else
        @provision.provisionar(num_memory, num_vcpu)
      end
    end

    private

    def num_acessos
      @main_view.menu_acessos
    end

    def define_resources(num_acessos)
      recursos = Array.new(2, -1)
      valores = read_file

      vcpu = 0
      valores.each do |valor|
        vcpu += 1
        val_1 = valor[0]
        val_2 = valor[1]
        coef_max = valor[2]
        coef_min = valor[3]
        if num_acessos <= coef_max && num_acessos >= coef_min
          memoria=(val_1*Math::E**(val_2*num_acessos))
          recursos[0] = memoria
          recursos[1] = vcpu
          return recursos
        else
          if num_acessos < coef_min
            recursos[0]=512
            recursos[1]=vcpu
            return recursos
          end
        end
      end
      return recursos
    end

  end
end