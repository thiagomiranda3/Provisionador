require File.dirname(__FILE__) + '/../models/provision'
require File.dirname(__FILE__) + '/../views/provision_view'

class ProvisionControl

  def initialize
    @provision = ::Provision.new
    @main_view = ProvisionView.new
  end

  def set_conn(obj_conn)
    @provision.set_conn(obj_conn)
  end

  def provisionar
    acessos = num_acessos
    num_memory = define_memory(acessos)
    num_vcpu = define_vcpu(acessos)
    @provision.provisionar(num_memory, num_vcpu)
  end

  private

  def num_acessos
    @main_view.menu_acessos
  end

  def define_memory(num_acessos)
    return 0
  end

  def define_vcpu(num_acessos)
    return 0
  end

end