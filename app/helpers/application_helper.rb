module ApplicationHelper
 #Title en el browser para las páginas
 def titulo_pagina
  titulo_base = "Recibo de Pago"
  if @perfil_name.nil?
    titulo_base
  else
    "#{titulo_base} | #{@perfil_name}"
  end
 end

#Titulo principal de cada página para el bloque titulo
 def titulo_principal
  titulo_base = "Pagina Principal"
  if @perfil_name.nil?
    titulo_base
  else
    if @titulo.nil?
      "#{@perfil_name} - #{titulo_base}"
    else
      "#{@perfil_name} - #{@titulo} "
    end
  end
 end
end

