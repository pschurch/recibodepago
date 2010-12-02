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
   if @titulo_unico.nil?
     titulo_base = "Pagina Principal"
   else
     titulo_base = @titulo_unico
   end
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

  # Orden Ascendente y Descendente en las columnas
  def sortable(column, title = nil)  
    title ||= column.titleize  
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
    link_to title, :sort => column, :direction => direction  
  end  

end

