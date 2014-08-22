# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/control'
require File.dirname(__FILE__) + '/view'
require 'fog'

########## Variáveis
try_n = 1
opcoes = Array.new
ENV['TERM'] = 'xterm'

########## Objetos
objcontrol = Control.new
objview = View.new

### Conectando ao XenServer
begin
  opcoes = objview.iniciar()
  objcontrol.connect(opcoes[0], opcoes[1])
  sleep(2)
  #exec('clear')
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


### Provisionando VM's
objcontrol.showmenu


### Gerenciando VM's