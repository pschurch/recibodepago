class ReceiptsController < ApplicationController
  before_filter :perfil_name
  before_filter :authenticate
  helper_method :sort_column, :sort_direction  

  #----------- vista para notificaciones --------------------
  def ntc  
    @titulo = "Recibo de Pago"
    if params[:id].nil?
      @rp_id = nil
    else
      @rp = Receipt.find(params[:id])
      @rp_id = @rp.id
    end
    @acc = params[:acc]
    case params[:acc] 
      when 'terr_button'  
        @msje = "se encuentra listo para ser impreso y ser enviado a terreno"
      when 'rech_button'  
        @msje = "ha sido rechazado"
      when 'actualiza_button'  
        @msje = "ha sido modificado correctamente"
      when 'cerr_sup'  
        @rp.update_attribute 'state', "cerrado"
        @rp.update_attribute 'area', "Supervisor"
        @rp.update_attribute 'subarea', ""
        @msje = "ha sido cerrado y se encuentra listo para ser Rendido a Tesoreria"
      when 'cerr_tsr'  
        @rp.update_attribute 'state', "cerrado"
        @rp.update_attribute 'area', "Tesoreria"
        @rp.update_attribute 'subarea', ""
        @msje = "ha sido cerrado y se encuentra listo para ser Remesado"
      when 's_anular_button'  
        @msje = "ha solicitado anulacion"
      when 'acep_ejc_jtr'  
        @rp.update_attribute 'state', "solicita gestion terreno"
        @rp.update_attribute 'area', "Terreno"
        @rp.update_attribute 'subarea', "Cobranza"
        @rp.update_attribute 'rech_mtvo', "" 
        @rp.update_attribute 'rejection_type_id', "" 
        @msje = "ha sido reenviado a Terreno"
      when 'acep_jtr_sup'  
        @rp.update_attribute 'state', "cerrado"
        @rp.update_attribute 'area', "Terreno"
        @rp.update_attribute 'subarea', ""
        @rp.update_attribute 'rech_mtvo', "" 
        @rp.update_attribute 'rejection_type_id', "" 
        @msje = "ha sido Aceptado y puede ser rendido a Supervisor nuevamente"
      when 'acep_ger_tsr'  
        @rp.update_attribute 'state', "cerrado"
        @rp.update_attribute 'area', "Gerencia"
        @rp.update_attribute 'subarea', ""
        @rp.update_attribute 'rech_mtvo', "" 
        @rp.update_attribute 'rejection_type_id', "" 
        @msje = "ha sido Aceptado y puede ser rendido a Tesoreria nuevamente"
      when 'acep_jtr_tsr'  
        @rp.update_attribute 'state', "cerrado"
        @rp.update_attribute 'area', "Terreno"
        @rp.update_attribute 'subarea', ""
        @rp.update_attribute 'rech_mtvo', "" 
        @rp.update_attribute 'rejection_type_id', "" 
        @msje = "ha sido Aceptado y puede ser rendido a Tesoreria nuevamente"
      when 'acep_ejc_sup'  
        @rp.update_attribute 'state', "cerrado"
        @rp.update_attribute 'area', "Cobranza"
        @rp.update_attribute 'subarea', ""
        @rp.update_attribute 'rech_mtvo', "" 
        @rp.update_attribute 'rejection_type_id', "" 
        @msje = "ha sido Aceptado y puede ser rendido a Supervisor nuevamente"
      when 'acep_sup_tsr'  
        @rp.update_attribute 'state', "cerrado"
        @rp.update_attribute 'area', "Supervisor"
        @rp.update_attribute 'subarea', ""
        @rp.update_attribute 'rech_mtvo', "" 
        @rp.update_attribute 'rejection_type_id', "" 
        @msje = "ha sido Aceptado y puede ser rendido a Tesoreria nuevamente"
      when 'dev_cobr'
        @rp.update_attribute 'state', 'rechazado' 
        @rp.update_attribute 'area', "Supervisor"
        @rp.update_attribute 'subarea', "Cobranza"
        @rp.update_attribute 'rech_by', current_user.name 
        @rp.update_attribute 'rech_date', Time.now   
        @msje = "ha sido enviado a Cobranza"
      when 'dev_terr'  
        @rp.update_attribute 'state', 'rechazado' 
        @rp.update_attribute 'area', "Supervisor"
        @rp.update_attribute 'subarea', "Terreno"
        @rp.update_attribute 'rech_by', current_user.name 
        @rp.update_attribute 'rech_date', Time.now   
        @msje = "ha sido enviado a Terreno"
      when 'anula_sup'  
        @rp.update_attribute 'state', "anulado"
        @rp.update_attribute 'area', ""
        @rp.update_attribute 'subarea', ""
        @rp.update_attribute 'canc_by', current_user.name 
        @rp.update_attribute 'canc_date', Time.now 
        @msje = "ha sido Anulado"
    end
  end

  #--------- Jefe Terreno -------------------
  def jtr
    deny_access unless (current_user.profile_id == 3)
    @groups   = Group.all
    params[:grupo].nil? ? @grupo = 0 : @grupo = params[:grupo]
    @accion = params[:ac]
    @total = 0
    case params[:ac] 
      when 'rend'  
        @titulo = "Rendir Recibos de Pago a Supervisores"
        if (@grupo==0 or @grupo=='0')
          @receipts1 = Receipt.where("state='cerrado'").where("area='Terreno'").where("
profile_create='1'").where("payment_flow_id=3")
        else 
          @receipts1 = Receipt.where("state='cerrado'").where("area='Terreno'").where("
profile_create='1'").where("group_id=?", @grupo).where("payment_flow_id=3")
        end
        @receipts2 = Receipt.where("state='rendido'").where("area='Terreno'").where("subarea='Supervisor'")
        @receipts2.each do |r|
          @total = @total + r.total_pay     
        end
      when 'rend_tsr'  
        @titulo = "Rendir Recibos de Pago a Tesoreria"
        @receipts1 = Receipt.where("state='cerrado'").where("area='Terreno'").where("
profile_create!='1'")
        @receipts2 = Receipt.where("state='rendido'").where("area='Terreno'").where("subarea='Tesoreria'")
        @receipts2.each do |r|
          @total = @total + r.total_pay     
        end
      when 'rech'  
        @titulo = "Recibos de Pago Rechazados"
        @receipts1 = Receipt.where("state='rechazado'").where("area='Supervisor'").where("subarea='Terreno'")
        @receipts2 = Receipt.where("state='recibido rechazo'").where("area='Terreno'").where("subarea='Supervisor'")
      when 'recht'  
        @titulo = "Recibos de Pago Rechazados"
        @receipts1 = Receipt.where("state='rechazado'").where("area='Tesoreria'").where("subarea='Terreno'")
        @receipts2 = Receipt.where("state='recibido rechazo'").where("area='Terreno'").where("subarea='Tesoreria'")
    end
    if params[:msg]=="1"
      @msg = "Debe seleccionar al menos un Recibo de Pago."
    end
  end

  def jtr_edit_multiple
    deny_access unless (current_user.profile_id == 3)
    if params[:rendir_button] 
      @titulo = "Rendicion de Recibos de Pago"
      @accion ="rend"
    elsif params[:rendir_tsr_button] 
      @titulo = "Rendicion de Recibos de Pago"
      @accion ="rend_tsr"
    elsif params[:aceptar_button] 
      @titulo = "Seleccion de Recibos de Pago"
      @accion = "rech"
    elsif params[:aceptar_tsr_button] 
      @titulo = "Seleccion de Recibos de Pago"
      @accion = "recht"
    end
    if params[:receipt_ids].nil?
      if params[:rendir_button] 
        redirect_to(:action => "jtr", :ac => "rend", :msg => "1" )
      elsif params[:rendir_tsr_button] 
        redirect_to(:action => "jtr", :ac => "rend_tsr", :msg => "1" )
      elsif params[:aceptar_button] 
        redirect_to(:action => "jtr", :ac => "rech", :msg => "1" )
      elsif params[:aceptar_tsr_button] 
        redirect_to(:action => "jtr", :ac => "recht", :msg => "1" )
      end
    else
     @receipts = Receipt.find(params[:receipt_ids]) 
     @formas  = Array.new
     @pay_forms = PaymentForm.where("state!=0")
     @pay_forms.each do |pf|
       @formas << pf.name
     end
     @efectivo = 0
     @total = 0
     @receipts.each do |r|
        @efectivo = @efectivo + r.monto1 unless r.formapago1!="Efectivo"    
        @efectivo = @efectivo + r.monto2 unless r.formapago2!="Efectivo"    
        @efectivo = @efectivo + r.monto3 unless r.formapago3!="Efectivo"    
        @efectivo = @efectivo + r.monto4 unless r.formapago4!="Efectivo"    
        @efectivo = @efectivo + r.monto5 unless r.formapago5!="Efectivo"    
        @efectivo = @efectivo + r.monto6 unless r.formapago6!="Efectivo"    
        @efectivo = @efectivo + r.monto7 unless r.formapago7!="Efectivo"    
        @efectivo = @efectivo + r.monto8 unless r.formapago8!="Efectivo"    
        @efectivo = @efectivo + r.monto9 unless r.formapago9!="Efectivo"    
        @efectivo = @efectivo + r.monto10 unless r.formapago10!="Efectivo"    
        @efectivo = @efectivo + r.monto11 unless r.formapago11!="Efectivo"    
        @efectivo = @efectivo + r.monto12 unless r.formapago12!="Efectivo"    
        @efectivo = @efectivo + r.monto13 unless r.formapago13!="Efectivo"    
        @efectivo = @efectivo + r.monto14 unless r.formapago14!="Efectivo"    
        @efectivo = @efectivo + r.monto15 unless r.formapago15!="Efectivo"    
        @efectivo = @efectivo + r.monto16 unless r.formapago16!="Efectivo"    
        @efectivo = @efectivo + r.monto17 unless r.formapago17!="Efectivo"    
        @efectivo = @efectivo + r.monto18 unless r.formapago18!="Efectivo"    
        @total = @total + r.total_paid
     end
    end
  end
  def jtr_update_multiple 
    @receipts = Receipt.find(params[:receipt_ids]) 
    if params[:rendir_button]  
      @receipts.each do |r|
        r.update_attribute 'state', 'rendido'  
        r.update_attribute 'area', 'Terreno'   
        r.update_attribute 'subarea', 'Supervisor'     
      end  
      redirect_to(:action => "jtr", :ac => "rend") 
    elsif params[:rendir_tsr_button]  
      @receipts.each do |r|
        r.update_attribute 'state', 'rendido'  
        r.update_attribute 'area', 'Terreno'   
        r.update_attribute 'subarea', 'Tesoreria'     
      end  
      redirect_to(:action => "jtr", :ac => "rend_tsr") 
    elsif params[:aceptar_button] 			# Acepta RP Rechazados de Sup
      @receipts.each do |r|
        r.update_attribute 'state', 'recibido rechazo'  
        r.update_attribute 'area', 'Terreno'
        r.update_attribute 'subarea', 'Supervisor'  
        #r.update_attribute 'rech_mtvo', ''
        #r.update_attribute 'rech_date', nil
        #r.update_attribute 'rech_by', ''
      end  
      redirect_to(:action => 'jtr', :ac => "rech") 
    elsif params[:aceptar_tsr_button] 			# Acepta RP Rechazados de Tsr
      @receipts.each do |r|
        r.update_attribute 'state', 'recibido rechazo'  
        r.update_attribute 'area', 'Terreno'
        r.update_attribute 'subarea', 'Tesoreria'  
      end  
      redirect_to(:action => 'jtr', :ac => "recht") 
    end
  end

  #--------- Supervisor -------------------
  def sup
    deny_access unless (current_user.profile_id == 2)
    @accion = params[:ac]
    @total = 0
    case params[:ac] 
      when 'recpc'  
        @titulo = "Recepcion de Recibos de Pago de Cobranza"
        @receipts1 = Receipt.where("group_id=?", current_user.group_id).where("state='rendido'").where("area='Cobranza'").where("subarea='Supervisor'")
        @receipts2 = Receipt.where("group_id=?", current_user.group_id).where("state='recepcionado'").where("area='Supervisor'").where("subarea='Cobranza'")
      when 'recpt'  
        @titulo = "Recepcion de Recibos de Pago de Terreno"
        @receipts1 = Receipt.where("group_id=?", current_user.group_id).where("state='rendido'").where("area='Terreno'").where("subarea='Supervisor'")
        @receipts2 = Receipt.where("group_id=?", current_user.group_id).where("state='recepcionado'").where("area='Supervisor'").where("subarea='Terreno'")
      when 'rend'  
        @titulo = "Rendir Recibos de Pago a Tesoreria"
        @receipts1 = Receipt.where("state='cerrado'").where("area='Supervisor'").where("group_id=?", current_user.group_id)
        @receipts2 = Receipt.where("state='rendido'").where("area='Supervisor'").where("group_id=?", current_user.group_id)
        @receipts2.each do |r|
          @total = @total + r.total_pay     
        end
      when 'rechts'  
        @titulo = "Recibos de Pago Rechazados por Tesoreria"
        @receipts1 = Receipt.where("state='rechazado'").where("area='Tesoreria'").where("group_id=?", current_user.group_id)
        @receipts2 = Receipt.where("state='recibido rechazo'").where("area='Supervisor'").where("subarea='Tesoreria'").where("group_id=?", current_user.group_id)
      when 'rechtr'  
        @titulo = "Recibos de Pago Rechazados por Terreno"
        @receipts1 = Receipt.where("state='rechazado'").where("area='Terreno'").where("group_id=?", current_user.group_id)
        @receipts2 = Receipt.where("group_id=?", current_user.group_id).where("state='recepcionado'").where("area='Supervisor'").where("subarea='Cobranza'")
    end
    if params[:msg]=="1"
      @msg = "Debe seleccionar al menos un Recibo de Pago."
    end
  end

  def sup_edit_multiple
    deny_access unless (current_user.profile_id == 2)
    if params[:recep_button]
      @titulo = "Recepcion de Recibos de Pago"
      @accion ="recpc"
    elsif params[:recept_button] 
      @titulo = "Recepcion de Recibos de Pago"
      @accion ="recpt"
    elsif params[:rendir_button] 
      @titulo = "Rendicion de Recibos de Pago"
      @accion ="rend"
    elsif params[:aceptatr_button] 
      @titulo = "Seleccion de Recibos de Pago"
      @accion ="rechtr"
    elsif params[:aceptats_button] 
      @titulo = "Seleccion de Recibos de Pago"
      @accion ="rechts"
    end
    if params[:receipt_ids].nil?
      if params[:recep_button] 
        redirect_to(:action => "sup", :ac => "recpc", :msg => "1" )
      elsif params[:recept_button] 
        redirect_to(:action => "sup", :ac => "recpt", :msg => "1" )
      elsif params[:rendir_button] 
        redirect_to(:action => "sup", :ac => "rend", :msg => "1" )
      elsif params[:aceptatr_button] 
        redirect_to(:action => "sup", :ac => "rechtr", :msg => "1" )
      elsif params[:aceptats_button] 
        redirect_to(:action => "sup", :ac => "rechts", :msg => "1" )
      end
    else
     @receipts = Receipt.find(params[:receipt_ids]) 
     @formas  = Array.new
     @pay_forms = PaymentForm.where("state!=0")
     @pay_forms.each do |pf|
       @formas << pf.name
     end
     @efectivo = 0
     @total = 0
     @receipts.each do |r|
        @efectivo = @efectivo + r.monto1 unless r.formapago1!="Efectivo"    
        @efectivo = @efectivo + r.monto2 unless r.formapago2!="Efectivo"    
        @efectivo = @efectivo + r.monto3 unless r.formapago3!="Efectivo"    
        @efectivo = @efectivo + r.monto4 unless r.formapago4!="Efectivo"    
        @efectivo = @efectivo + r.monto5 unless r.formapago5!="Efectivo"    
        @efectivo = @efectivo + r.monto6 unless r.formapago6!="Efectivo"    
        @efectivo = @efectivo + r.monto7 unless r.formapago7!="Efectivo"    
        @efectivo = @efectivo + r.monto8 unless r.formapago8!="Efectivo"    
        @efectivo = @efectivo + r.monto9 unless r.formapago9!="Efectivo"    
        @efectivo = @efectivo + r.monto10 unless r.formapago10!="Efectivo"    
        @efectivo = @efectivo + r.monto11 unless r.formapago11!="Efectivo"    
        @efectivo = @efectivo + r.monto12 unless r.formapago12!="Efectivo"    
        @efectivo = @efectivo + r.monto13 unless r.formapago13!="Efectivo"    
        @efectivo = @efectivo + r.monto14 unless r.formapago14!="Efectivo"    
        @efectivo = @efectivo + r.monto15 unless r.formapago15!="Efectivo"    
        @efectivo = @efectivo + r.monto16 unless r.formapago16!="Efectivo"    
        @efectivo = @efectivo + r.monto17 unless r.formapago17!="Efectivo"    
        @efectivo = @efectivo + r.monto18 unless r.formapago18!="Efectivo"    
        @total = @total + r.total_paid
     end
    end
  end
  def sup_update_multiple 
    @receipts = Receipt.find(params[:receipt_ids]) 
    if params[:recepcionc_button] 
      @receipts.each do |r|
        r.update_attribute 'state', 'recepcionado'
        r.update_attribute 'area', 'Supervisor' 
        r.update_attribute 'subarea', 'Cobranza' 
      end  
      redirect_to(:action => "sup", :ac => "recpc") 
    elsif params[:recepciont_button] 
      @receipts.each do |r|
        r.update_attribute 'state', 'recepcionado'
        r.update_attribute 'area', 'Supervisor' 
        r.update_attribute 'subarea', 'Terreno' 
      end  
      redirect_to(:action => "sup", :ac => "recpt") 
    elsif params[:rech_ejc_button]  
      @texto=""
      for i in (0..params[:receipt_ids].count-1) 
        @texto=@texto + params[:receipt_ids][i].to_s + ", " unless i==params[:receipt_ids].count-1
        @texto=@texto + params[:receipt_ids][i].to_s + ". " unless i!=params[:receipt_ids].count-1
      end
      @receipts.each do |r|
        r.update_attribute 'state', 'rechazado' 
        r.update_attribute 'area', 'Supervisor' 
        r.update_attribute 'subarea', 'Cobranza' 
        r.update_attribute 'rejection_type_id', '3' 
        r.update_attribute 'rech_by', current_user.name 
        r.update_attribute 'rech_mtvo', 'Recibos de Pago: ' + @texto 
        r.update_attribute 'rech_date', Time.now 
      end  
      redirect_to(:action => "sup", :ac => "recpc") 
    elsif params[:rech_terr_button]  
      @texto=""
      for i in (0..params[:receipt_ids].count-1) 
        @texto=@texto + params[:receipt_ids][i].to_s + ", " unless i==params[:receipt_ids].count-1
        @texto=@texto + params[:receipt_ids][i].to_s + ". " unless i!=params[:receipt_ids].count-1
      end
      @receipts.each do |r|
        r.update_attribute 'state', 'rechazado' 
        r.update_attribute 'area', 'Supervisor' 
        r.update_attribute 'subarea', 'Terreno' 
        r.update_attribute 'rejection_type_id', '3' 
        r.update_attribute 'rech_by', current_user.name 
        r.update_attribute 'rech_mtvo', 'Recibos de Pago: ' + @texto 
        r.update_attribute 'rech_date', Time.now 
      end  
      redirect_to(:action => "sup", :ac => "recpt") 
    elsif params[:rendir_button]  
      @receipts.each do |r|
        r.update_attribute 'state', 'rendido'  
        r.update_attribute 'area', 'Supervisor'   
        r.update_attribute 'subarea', 'Tesoreria'     
      end  
      redirect_to(:action => "sup", :ac => "rend") 
    elsif params[:acepta_trr_button]  
      @receipts.each do |r|
        r.update_attribute 'state', 'recibido rechazo'  
        r.update_attribute 'area', 'Supervisor'
        r.update_attribute 'subarea', 'Terreno'  
      end  
      redirect_to(:action => 'sup', :ac => "rechtr")  

    elsif params[:acepta_tsr_button]  
      @receipts.each do |r|
        r.update_attribute 'state', 'recibido rechazo'  
        r.update_attribute 'area', 'Supervisor'
        r.update_attribute 'subarea', 'Tesoreria'  
      end  
      redirect_to(:action => 'sup', :ac => "rechts")  
    end
  end 

  #--------- Tesoreria -------------------
  def tsr
    deny_access unless (current_user.profile_id==4)
    @accion = params[:ac]
    case params[:ac] 
      when 'recpc'  
        @titulo = "Recepcion de Recibos de Pago de Supervisor"
        @receipts1 = Receipt.where("state='rendido'").where("area='Supervisor'").where("subarea='Tesoreria'")
        @receipts2 = Receipt.where("state='recepcionado'").where("area='Tesoreria'").where("subarea='Supervisor'")
      when 'recpt'  
        @titulo = "Recepcion de Recibos de Pago de Terreno"
        @receipts1 = Receipt.where("state='rendido'").where("area='Terreno'").where("subarea='Tesoreria'")
        @receipts2 = Receipt.where("state='recepcionado'").where("area='Tesoreria'").where("subarea='Terreno'")
      when 'recpg'  
        @titulo = "Recepcion de Recibos de Pago de Gerencia"
        @receipts1 = Receipt.where("state='rendido'").where("area='Gerencia'").where("subarea='Tesoreria'")
        @receipts2 = Receipt.where("state='recepcionado'").where("area='Tesoreria'").where("subarea='Gerencia'")

    end
    if params[:msg]=="1"
      @msg = "Debe seleccionar al menos un Recibo de Pago."
    end
  end

  def tsr_edit_multiple
    deny_access unless (current_user.profile_id==4)
    if params[:recep_button]
      @titulo = "Recepcion de Recibos de Pago"
      @accion ="recpc"
    elsif params[:recept_button]
      @titulo = "Recepcion de Recibos de Pago"
      @accion ="recpt"
    elsif params[:recepg_button]
      @titulo = "Recepcion de Recibos de Pago"
      @accion ="recpg"
    end
    if params[:receipt_ids].nil?
      if params[:recep_button] 
        redirect_to(:action => "tsr", :ac => "recpc", :msg => "1" )
      elsif params[:recept_button] 
        redirect_to(:action => "tsr", :ac => "recpt", :msg => "1" )
      elsif params[:recepg_button] 
        redirect_to(:action => "tsr", :ac => "recpg", :msg => "1" )
      end
    else
     @receipts = Receipt.find(params[:receipt_ids]) 
     @formas  = Array.new
     @pay_forms = PaymentForm.where("state!=0")
     @pay_forms.each do |pf|
       @formas << pf.name
     end
     @efectivo = 0
     @total = 0
     @receipts.each do |r|
        @efectivo = @efectivo + r.monto1 unless r.formapago1!="Efectivo"    
        @efectivo = @efectivo + r.monto2 unless r.formapago2!="Efectivo"    
        @efectivo = @efectivo + r.monto3 unless r.formapago3!="Efectivo"    
        @efectivo = @efectivo + r.monto4 unless r.formapago4!="Efectivo"    
        @efectivo = @efectivo + r.monto5 unless r.formapago5!="Efectivo"    
        @efectivo = @efectivo + r.monto6 unless r.formapago6!="Efectivo"    
        @efectivo = @efectivo + r.monto7 unless r.formapago7!="Efectivo"    
        @efectivo = @efectivo + r.monto8 unless r.formapago8!="Efectivo"    
        @efectivo = @efectivo + r.monto9 unless r.formapago9!="Efectivo"    
        @efectivo = @efectivo + r.monto10 unless r.formapago10!="Efectivo"    
        @efectivo = @efectivo + r.monto11 unless r.formapago11!="Efectivo"    
        @efectivo = @efectivo + r.monto12 unless r.formapago12!="Efectivo"    
        @efectivo = @efectivo + r.monto13 unless r.formapago13!="Efectivo"    
        @efectivo = @efectivo + r.monto14 unless r.formapago14!="Efectivo"    
        @efectivo = @efectivo + r.monto15 unless r.formapago15!="Efectivo"    
        @efectivo = @efectivo + r.monto16 unless r.formapago16!="Efectivo"    
        @efectivo = @efectivo + r.monto17 unless r.formapago17!="Efectivo"    
        @efectivo = @efectivo + r.monto18 unless r.formapago18!="Efectivo"    
        @total = @total + r.total_paid
     end
    end
  end
  def tsr_update_multiple 
    @receipts = Receipt.find(params[:receipt_ids]) 
    if params[:recep_button] 
      @receipts.each do |r|
        r.update_attribute 'state', 'recepcionado'
        r.update_attribute 'area', 'Tesoreria' 
        r.update_attribute 'subarea', 'Supervisor' 
      end  
      redirect_to(:action => "tsr", :ac => "recpc") 
    elsif params[:recept_button] 
      @receipts.each do |r|
        r.update_attribute 'state', 'recepcionado'
        r.update_attribute 'area', 'Tesoreria' 
        r.update_attribute 'subarea', 'Terreno' 
      end  
      redirect_to(:action => "tsr", :ac => "recpt") 
    elsif params[:recepg_button] 
      @receipts.each do |r|
        r.update_attribute 'state', 'recepcionado'
        r.update_attribute 'area', 'Tesoreria' 
        r.update_attribute 'subarea', 'Gerencia' 
      end  
      redirect_to(:action => "tsr", :ac => "recpg") 
    elsif params[:rech_button]  
      @texto=""
      for i in (0..params[:receipt_ids].count-1) 
        @texto=@texto + params[:receipt_ids][i].to_s + ", " unless i==params[:receipt_ids].count-1
        @texto=@texto + params[:receipt_ids][i].to_s + ". " unless i!=params[:receipt_ids].count-1
      end
      @receipts.each do |r|
        r.update_attribute 'state', 'rechazado' 
        r.update_attribute 'area', 'Tesoreria' 
        r.update_attribute 'subarea', 'Supervisor' 
        r.update_attribute 'rejection_type_id', '3' 
        r.update_attribute 'rech_by', current_user.name 
        r.update_attribute 'rech_mtvo', 'Recibos de Pago: ' + @texto 
        r.update_attribute 'rech_date', Time.now 
      end  
      redirect_to(:action => "tsr", :ac => "recpc") 
    elsif params[:recht_button]  
      @texto=""
      for i in (0..params[:receipt_ids].count-1) 
        @texto=@texto + params[:receipt_ids][i].to_s + ", " unless i==params[:receipt_ids].count-1
        @texto=@texto + params[:receipt_ids][i].to_s + ". " unless i!=params[:receipt_ids].count-1
      end
      @receipts.each do |r|
        r.update_attribute 'state', 'rechazado' 
        r.update_attribute 'area', 'Tesoreria' 
        r.update_attribute 'subarea', 'Terreno' 
        r.update_attribute 'rejection_type_id', '3' 
        r.update_attribute 'rech_by', current_user.name 
        r.update_attribute 'rech_mtvo', 'Recibos de Pago: ' + @texto 
        r.update_attribute 'rech_date', Time.now 
      end  
      redirect_to(:action => "tsr", :ac => "recpt") 
    elsif params[:rechg_button]  
      @texto=""
      for i in (0..params[:receipt_ids].count-1) 
        @texto=@texto + params[:receipt_ids][i].to_s + ", " unless i==params[:receipt_ids].count-1
        @texto=@texto + params[:receipt_ids][i].to_s + ". " unless i!=params[:receipt_ids].count-1
      end
      @receipts.each do |r|
        r.update_attribute 'state', 'rechazado' 
        r.update_attribute 'area', 'Tesoreria' 
        r.update_attribute 'subarea', 'Gerencia' 
        r.update_attribute 'rejection_type_id', '3' 
        r.update_attribute 'rech_by', current_user.name 
        r.update_attribute 'rech_mtvo', 'Recibos de Pago: ' + @texto 
        r.update_attribute 'rech_date', Time.now 
      end  
      redirect_to(:action => "tsr", :ac => "recpg") 
    end
  end
  #------------------- Cobranza ---------------------------
  def ejc
    deny_access unless (current_user.profile_id==1)
    @accion = params[:ac]
    @total = 0
    case params[:ac] 
      when 'rend'  
        @titulo = "Rendir Recibos de Pago a Supervisor"
        @receipts1 = Receipt.where("state='cerrado'").where("area='Cobranza'").where("user_name=?", current_user.name)
        @receipts2 = Receipt.where("state='rendido'").where("area='Cobranza'").where("user_name=?", current_user.name)
        @receipts2.each do |r|
          @total = @total + r.total_pay     
        end
      when 'rech'  
        @titulo = "Recibos de Pago Rechazados"
        @receipts1 = Receipt.where("state='rechazado'").where("area='Supervisor'").where("user_name=?", current_user.name)
        @receipts2 = Receipt.where("state='recibido rechazo'").where("area='Cobranza'").where("subarea='Supervisor'").where("user_name=?", current_user.name)
      when 'recht'  
        @titulo = "Recibos de Pago Rechazados"
        @receipts1 = Receipt.where("state='recibido rechazo'").where("area='Cobranza'").where("subarea='Terreno'").where("user_name=?", current_user.name)
    end
    if params[:msg]=="1"
      @msg = "Debe seleccionar al menos un Recibo de Pago."
    end
  end

  def ejc_edit_multiple   
    deny_access unless (current_user.profile_id==1)
    if params[:aceptar_button] 			# EjCobranza Acepta RP Rechazados de Sup
      @titulo = "Seleccion de Recibos de Pago"
      @accion = "rech"
    elsif params[:aceptart_button] 		# EjCobranza Acepta RP Rechazados de Terreno 
      #redirect_to(:action => "ejc_update_multiple", :name => "aceptart_button" ) 
      #@titulo = "Seleccion de Recibos de Pago"
      #@accion = "recht"
    elsif params[:rendir_button] 		# EjCobranza Rinde RP a Supervisor
      @titulo = "Rendicion de Recibos de Pago"
      @accion = "rend"
    end
    if params[:receipt_ids].nil?
      if params[:rendir_button] 		# EjCobranza Rinde RP a Supervisor
        redirect_to(:action => "ejc", :msg => "1", :ac => "rend" ) 
      elsif params[:aceptar_button] 		# EjCobranza Acepta RP Rechazados de Sup
        redirect_to(:action => "ejc", :msg => "1", :ac => "rech" ) 
      elsif params[:aceptart_button] 		# EjCobranza Acepta RP Rechazados de Terr
        redirect_to(:action => "ejc", :msg => "1", :ac => "recht" ) 
      end
    else
      @receipts = Receipt.find(params[:receipt_ids]) 
      @formas  = Array.new
      @pay_forms = PaymentForm.where("state!=0")
      @pay_forms.each do |pf|
        @formas << pf.name
      end
      @efectivo = 0
      @total = 0
      @receipts.each do |r|
         @efectivo = @efectivo + r.monto1 unless r.formapago1!="Efectivo"    
         @efectivo = @efectivo + r.monto2 unless r.formapago2!="Efectivo"    
         @efectivo = @efectivo + r.monto3 unless r.formapago3!="Efectivo"    
         @efectivo = @efectivo + r.monto4 unless r.formapago4!="Efectivo"    
         @efectivo = @efectivo + r.monto5 unless r.formapago5!="Efectivo"    
         @efectivo = @efectivo + r.monto6 unless r.formapago6!="Efectivo"    
         @efectivo = @efectivo + r.monto7 unless r.formapago7!="Efectivo"    
         @efectivo = @efectivo + r.monto8 unless r.formapago8!="Efectivo"    
         @efectivo = @efectivo + r.monto9 unless r.formapago9!="Efectivo"    
         @efectivo = @efectivo + r.monto10 unless r.formapago10!="Efectivo"    
         @efectivo = @efectivo + r.monto11 unless r.formapago11!="Efectivo"    
         @efectivo = @efectivo + r.monto12 unless r.formapago12!="Efectivo"    
         @efectivo = @efectivo + r.monto13 unless r.formapago13!="Efectivo"    
         @efectivo = @efectivo + r.monto14 unless r.formapago14!="Efectivo"    
         @efectivo = @efectivo + r.monto15 unless r.formapago15!="Efectivo"    
         @efectivo = @efectivo + r.monto16 unless r.formapago16!="Efectivo"    
         @efectivo = @efectivo + r.monto17 unless r.formapago17!="Efectivo"    
         @efectivo = @efectivo + r.monto18 unless r.formapago18!="Efectivo"    
         @total = @total + r.total_paid
      end
    end
  end  
  def ejc_update_multiple  
    @receipts = Receipt.find(params[:receipt_ids]) 
    if params[:aceptar_button] 			# EjCobranza Acepta RP Rechazados de Sup
      @receipts.each do |r|
        r.update_attribute 'state', 'recibido rechazo'  
        r.update_attribute 'area', 'Cobranza'
        r.update_attribute 'subarea', 'Supervisor'  
        #r.update_attribute 'rech_mtvo', ''
        #r.update_attribute 'rech_date', nil
        #r.update_attribute 'rech_by', ''
      end  
      redirect_to(:action => 'ejc', :ac => "rech") 
    elsif params[:aceptart_button] 			# EjCobranza Acepta RP Rechazados de Terr
      @receipts.each do |r|
        r.update_attribute 'state', 'cerrado'  
        r.update_attribute 'area', 'Cobranza'
        r.update_attribute 'subarea', 'Terreno'  
        #r.update_attribute 'rech_mtvo', ''
        #r.update_attribute 'rech_date', nil
        #r.update_attribute 'rech_by', ''
      end  
      redirect_to(:action => 'ejc', :ac => "recht") 
    elsif params[:rendir_button] 		# EjCobranza Rinde RP a Supervisor
      @receipts.each do |r|
        r.update_attribute 'state', 'rendido'  
        r.update_attribute 'area', 'Cobranza'   
        r.update_attribute 'subarea', 'Supervisor'     
      end  
      redirect_to(:action => 'ejc', :ac => "rend") 
    end
  end 

  #------------------- Gerencia ---------------------------
  def ger
    deny_access unless (current_user.profile_id==6)
    @accion = params[:ac]
    @total = 0
    case params[:ac] 
      when 'rend'  
        @titulo = "Rendir Recibos de Pago a Tesoreria"
        @receipts1 = Receipt.where("state='cerrado'").where("area='Gerencia'")
        @receipts2 = Receipt.where("state='rendido'").where("area='Gerencia'")
        @receipts2.each do |r|
          @total = @total + r.total_pay     
        end
      when 'rechts'  
        @titulo = "Recibos de Pago Rechazados por Tesoreria"
        @receipts1 = Receipt.where("state='rechazado'").where("area='Tesoreria'").where("subarea='Gerencia'")
        @receipts2 = Receipt.where("state='recibido rechazo'").where("area='Gerencia'").where("subarea='Tesoreria'")
    end
    if params[:msg]=="1"
      @msg = "Debe seleccionar al menos un Recibo de Pago."
    end
  end
  def ger_edit_multiple   
    deny_access unless (current_user.profile_id==6)
    if params[:rendir_button] 
      @titulo = "Rendicion de Recibos de Pago"
      @accion ="rend"
    elsif params[:aceptar_tsr_button] 
      @titulo = "Seleccion de Recibos de Pago"
      @accion = "rechts"
    end
    if params[:receipt_ids].nil?
      if params[:rendir_button] 
        redirect_to(:action => "ger", :ac => "rend", :msg => "1" )
      elsif params[:aceptar_tsr_button] 
        redirect_to(:action => "ger", :ac => "rechts", :msg => "1" )
      end
    else
     @receipts = Receipt.find(params[:receipt_ids]) 
     @formas  = Array.new
     @pay_forms = PaymentForm.where("state!=0")
     @pay_forms.each do |pf|
       @formas << pf.name
     end
     @efectivo = 0
     @total = 0
     @receipts.each do |r|
        @efectivo = @efectivo + r.monto1 unless r.formapago1!="Efectivo"    
        @efectivo = @efectivo + r.monto2 unless r.formapago2!="Efectivo"    
        @efectivo = @efectivo + r.monto3 unless r.formapago3!="Efectivo"    
        @efectivo = @efectivo + r.monto4 unless r.formapago4!="Efectivo"    
        @efectivo = @efectivo + r.monto5 unless r.formapago5!="Efectivo"    
        @efectivo = @efectivo + r.monto6 unless r.formapago6!="Efectivo"    
        @efectivo = @efectivo + r.monto7 unless r.formapago7!="Efectivo"    
        @efectivo = @efectivo + r.monto8 unless r.formapago8!="Efectivo"    
        @efectivo = @efectivo + r.monto9 unless r.formapago9!="Efectivo"    
        @efectivo = @efectivo + r.monto10 unless r.formapago10!="Efectivo"    
        @efectivo = @efectivo + r.monto11 unless r.formapago11!="Efectivo"    
        @efectivo = @efectivo + r.monto12 unless r.formapago12!="Efectivo"    
        @efectivo = @efectivo + r.monto13 unless r.formapago13!="Efectivo"    
        @efectivo = @efectivo + r.monto14 unless r.formapago14!="Efectivo"    
        @efectivo = @efectivo + r.monto15 unless r.formapago15!="Efectivo"    
        @efectivo = @efectivo + r.monto16 unless r.formapago16!="Efectivo"    
        @efectivo = @efectivo + r.monto17 unless r.formapago17!="Efectivo"    
        @efectivo = @efectivo + r.monto18 unless r.formapago18!="Efectivo"    
        @total = @total + r.total_paid
     end
    end
  end
  def ger_update_multiple 
    @receipts = Receipt.find(params[:receipt_ids]) 
    if params[:rendir_button]  
      @receipts.each do |r|
        r.update_attribute 'state', 'rendido'  
        r.update_attribute 'area', 'Gerencia'   
        r.update_attribute 'subarea', 'Tesoreria'     
      end  
      redirect_to(:action => "ger", :ac => "rend") 
    elsif params[:aceptar_tsr_button] 			# Acepta RP Rechazados de Tes
      @receipts.each do |r|
        r.update_attribute 'state', 'recibido rechazo'  
        r.update_attribute 'area', 'Gerencia'
        r.update_attribute 'subarea', 'Tesoreria'  
      end  
      redirect_to(:action => 'ger', :ac => "rechts") 
    end
  end

  #=======================================================
  def create_rp   # listk
    deny_access unless (current_user.profile_id==1 or current_user.profile_id==2 or current_user.profile_id==3 or current_user.profile_id==6 or current_user.profile_id==8)
    session[:ticket_ids] = nil
    @titulo = "Crear Recibo de Pago"
    grupo = current_user.group_id
    if current_user.profile_id==1 #"Ejecutivo de Cobranza"
      @tickets = Ticket.where("state='creado' OR state='modificado'").where("group_id=?", grupo).where("profile_create!='2'").order(sort_column + ' ' + sort_direction)         
    elsif current_user.profile_id==2  # "Supervisor"
      @tickets = Ticket.where("state='creado' OR state='modificado'").where("profile_create!='6'")
    elsif current_user.profile_id==3  #"Jefe de Terreno"
      @tickets = Ticket.where("state='creado' OR state='modificado'").where("profile_create!='6'")
    elsif current_user.profile_id==6  #"Gerencia"
      @tickets = Ticket.where("state='creado' OR state='modificado'")
    elsif current_user.profile_id==8   #"Designer"
       @tickets = Ticket.where("state='creado' OR state='modificado'")
    end 
    if not params[:msg].nil?
      case params[:msg]
        when "1"
        @msg = "Debe seleccionar al menos un Ticket"
        when "2"
        @msg = "No se puede crear un mismo Recibo de Pago para diferentes Mandantes" 
        when "3"
        @msg = "No se puede crear un mismo Recibo de Pago para diferentes Productos" 
        when "4"
        @msg = "No se puede crear un mismo Recibo de Pago para diferentes Tipos de Cobranza" 
        when "5"
        @msg = "Todos los Tickets deben tener las misma fecha de pago de deuda"
      end
    end
  end

  def index
    deny_access unless (current_user.profile_id == 1)
    @titulo = "Listado de Recibos de Pago"
    @t=Time.now
    params[:area].nil? ? @area = 'Todas' : @area = params[:area]
    params[:estado].nil? ? @estado = 'Todos' : @estado = params[:estado]
    if (@area=='Todas' and @estado=='Todos')
      @receipts = Receipt.where("group_id=?", current_user.group_id)
    elsif (@area=='Todas' and @estado!='Todos')
      @receipts = Receipt.where("state=?", @estado).where("group_id=?", current_user.group_id)
    elsif (@area!='Todas' and @estado=='Todos')
      @receipts = Receipt.where("area=?", @area).where("group_id=?", current_user.group_id)
    else
      @receipts = Receipt.where("area=?", @area).where("state=?", @estado).where("group_id=?", current_user.group_id)
    end
  end

  def show
    @titulo = "Ver Recibo de Pago"
    @receipt = Receipt.find(params[:id])
    @tickets = Ticket.where("receipt_id=?", @receipt.id)
  end

  #-------------- new2.html.erb ------------------
  def new2
    if params[:ticket_ids].nil?
      redirect_to(:action => "create_rp", :msg => "1" ) #"Debe seleccionar al menos un Ticket"
    else
      session[:ticket_ids] = params[:ticket_ids]
      @tickets = Ticket.find(params[:ticket_ids])
      @mandante = @tickets.first.principal_id
      @producto = @tickets.first.product_id
      @tipo_cobranza = @tickets.first.collection_type_id
      @fecha_pago = @tickets.first.date_pay.strftime("%d/%m/%Y")
      @tickets.each do |a|
        if not(a.principal_id == @mandante)
          @msg = "2"  #"No se puede crear un solo Recibo de Pago para diferentes Mandantes"
        elsif not(a.product_id == @producto)
          @msg = "3"  #"No se puede crear un solo Recibo de Pago para diferentes Productos"
        elsif not(a.collection_type_id == @tipo_cobranza)
          @msg = "4"  #"No se puede crear un solo Recibo de Pago para diferentes Tipos de Cobranza"
        elsif not(a.date_pay.strftime("%d/%m/%Y") == @fecha_pago)
          @msg = "5" #"Fechas de pago no coinciden"
        end
      end
      if not @msg.nil?
        redirect_to(:action => "create_rp", :msg => @msg )
      end
      @titulo = "Crear Recibo de Pago"
      session[:receipt_step] = nil
      @receipt = Receipt.new
      session[:nuevo] = true
      @total_rp = 0
      @tickets.each do |a|
        if a.new_total_pay.nil?
          @total_rp = @total_rp + a.total_pay
        else
          @total_rp = @total_rp + a.new_total_pay
        end
      end
    end
  end

  #------------ POST /receipts --------------------
  def create
    @titulo = "Crear Recibo de Pago"
    @tickets = Ticket.find(session[:ticket_ids])
    @mandante = @tickets.first.principal_id
    @producto = @tickets.first.product_id
    @tipo_cobranza = @tickets.first.collection_type_id
    @fecha_pago = @tickets.first.date_pay
    @receipt = Receipt.new(params[:receipt])  
    @receipt.current_step = session[:receipt_step]  
    for a in PaymentAgreement.where("id =?", @receipt.payment_agreement_id) 
      @payment_agreement = a.name
      @payment_flow = a.payment_flow_id
    end 
#----------
      @formas  = Array.new
      @pay_p = PaymentPolicy.where("principal_id =?", @mandante).where("product_id =?", @producto).where("collection_type_id =?", @tipo_cobranza)
      if @pay_p.empty?
        @payment_form_list = PaymentForm.where("state=true")
        @payment_form_list.each do |pf|
          @formas << pf.id
        end

      else
        @ppid = @pay_p.first.id
        @payment_form_list = PaymentFormsPaymentPolicies.where("payment_policy_id=?", @ppid)
        @payment_form_list.each do |pf|
          @formas << pf.payment_form_id
        end
      end
#------------
    @total_rp = 0
    @tickets.each do |a|
      if a.new_total_pay.nil?
        @total_rp = @total_rp + a.total_pay
      else
        @total_rp = @total_rp + a.new_total_pay
      end
    end
    if params[:next_button]     
      @receipt.next_step  
    elsif params[:rec_button]  
      @receipt.save 
    end  
    session[:receipt_step] = @receipt.current_step  
    if @receipt.new_record?  
      render :action => "new2"  
    else 
      @receipt.update_attribute 'profile', current_user.profile_id
      @receipt.update_attribute 'profile_create', current_user.profile_id
      @total_paid = 0
      if @payment_flow==1 # if (not session[:tickets_ids].nil?) 
        @total_paid = (not @receipt.monto1.nil?) ? @total_paid + @receipt.monto1 : @total_paid
        @total_paid = (not @receipt.monto2.nil?) ? @total_paid + @receipt.monto2 : @total_paid
        @total_paid = (not @receipt.monto3.nil?) ? @total_paid + @receipt.monto3 : @total_paid
        @total_paid = (not @receipt.monto4.nil?) ? @total_paid + @receipt.monto4 : @total_paid
        @total_paid = (not @receipt.monto5.nil?) ? @total_paid + @receipt.monto5 : @total_paid
        @total_paid = (not @receipt.monto6.nil?) ? @total_paid + @receipt.monto6 : @total_paid
        @total_paid = (not @receipt.monto7.nil?) ? @total_paid + @receipt.monto7 : @total_paid
        @total_paid = (not @receipt.monto8.nil?) ? @total_paid + @receipt.monto8 : @total_paid
        @total_paid = (not @receipt.monto9.nil?) ? @total_paid + @receipt.monto9 : @total_paid
        @total_paid = (not @receipt.monto10.nil?) ? @total_paid + @receipt.monto10 : @total_paid
        @total_paid = (not @receipt.monto11.nil?) ? @total_paid + @receipt.monto11 : @total_paid
        @total_paid = (not @receipt.monto12.nil?) ? @total_paid + @receipt.monto12 : @total_paid
        @total_paid = (not @receipt.monto13.nil?) ? @total_paid + @receipt.monto13 : @total_paid
        @total_paid = (not @receipt.monto14.nil?) ? @total_paid + @receipt.monto14 : @total_paid
        @total_paid = (not @receipt.monto15.nil?) ? @total_paid + @receipt.monto15 : @total_paid
        @total_paid = (not @receipt.monto16.nil?) ? @total_paid + @receipt.monto16 : @total_paid
        @total_paid = (not @receipt.monto17.nil?) ? @total_paid + @receipt.monto17 : @total_paid
        @total_paid = (not @receipt.monto18.nil?) ? @total_paid + @receipt.monto18 : @total_paid
      end
      @receipt.update_attribute 'total_paid', @total_paid  
      @receipt.update_attribute 'group_id', current_user.group_id
      @receipt.update_attribute 'principal_id', @mandante
      @receipt.update_attribute 'product_id', @producto
      @receipt.update_attribute 'date_r', @fecha_pago
      @tickets.each do |t|
        t.update_attribute 'receipt_id', @receipt.id   
        t.update_attribute 'state', 'recibo creado'  
        @caso = Assignment.where("ticket_id =?", t.id)
        @caso.each do |c|
          c.update_attribute 'state', "rp_creado"       
          c.update_attribute 'receipt_id', @receipt.id   
        end
      end
      session[:tickets_ids] = nil
      # Solo para Flujo de Pago 1 (RP Completo)
      if @payment_flow==1 
        @receipt.update_attribute 'state', 'cerrado'
        if current_user.profile_id == 1  # Cobranza 
          @receipt.update_attribute 'area', 'Cobranza'
        elsif current_user.profile_id == 2  # Supervisor 
          @receipt.update_attribute 'area', 'Supervisor'
        elsif current_user.profile_id == 3  # Terreno 
          @receipt.update_attribute 'area', 'Terreno'
        elsif current_user.profile_id == 6  # Gerencia 
          @receipt.update_attribute 'area', 'Gerencia'
        end   
        redirect_to(@receipt, :notice => 'El Recibo de Pago se ha cerrado exitosamente y se encuentra listo para ser impreso y rendido.') 
      # Solo para Flujo de Pago 2 (RP por Completar)    
      elsif @payment_flow==2 
        @receipt.update_attribute 'state', 'abierto'
        if current_user.profile_id == 1  # Cobranza 
          @receipt.update_attribute 'area', 'Cobranza'
        elsif current_user.profile_id == 2  # Supervisor 
          @receipt.update_attribute 'area', 'Supervisor'
        elsif current_user.profile_id == 3  # Terreno 
          @receipt.update_attribute 'area', 'Terreno'
        elsif current_user.profile_id == 6  # Gerencia 
          @receipt.update_attribute 'area', 'Gerencia'
        end   
        redirect_to(@receipt, :notice => 'El Recibo de Pago se ha creado exitosamente y se encuentra listo para ser impreso.') 
      # Solo para Flujo de Pago 3 (RP con Gestion Terreno) 
      elsif @payment_flow==3
        @receipt.update_attribute 'state', 'solicita gestion terreno'
        @receipt.update_attribute 'area', 'Terreno'
        @receipt.update_attribute 'subarea', 'Cobranza'
        redirect_to(@receipt, :notice => 'El Recibo de Pago se ha creado exitosamente y se encuentra listo para ser enviado a terreno.') 
      # existe un Error
      else
      end  
    end  
  end

  #=======================================================
  def edit 
    @receipt = Receipt.find(params[:id])
    deny_access unless (@receipt.state!='cerrado') # No puede editarse un RP estado cerrado
    @titulo = "Editar Recibo de Pago"
    @button = params[:button]
    @msg = params[:msg]
    @tickets = Ticket.where("receipt_id=?", @receipt.id)
    @receipt.update_attribute 'profile', current_user.profile_id
    @mandante = @tickets.first.principal_id
    @producto = @tickets.first.product_id
    @tipo_cobranza = @tickets.first.collection_type_id
    #----------
    @formas  = Array.new
    @pay_p = PaymentPolicy.where("principal_id =?", @mandante).where("product_id =?", @producto).where("collection_type_id =?", @tipo_cobranza)
    if @pay_p.empty?
      @payment_form_list = PaymentFormsPaymentPolicies.all
    else
      @ppid = @pay_p.first.id
      @payment_form_list = PaymentFormsPaymentPolicies.where("payment_policy_id=?", @ppid)
    end
    @payment_form_list.each do |pf|
      @formas << pf.payment_form_id
    end
    #----- Mensajes para anulaciones -------
    if (@button=="n2" and @receipt.state=="abierto" and (@receipt.payment_flow_id==2 or @receipt.payment_flow_id==3))
      @cancellation = Cancellation.where("id=2")
      @msg_anula = @cancellation.first.message
    elsif (@button=="n3" and @receipt.state=='recibido rechazo')
      @cancellation = Cancellation.where("id=3")
      @msg_anula = @cancellation.first.message
    elsif (@button=="n1" and @receipt.state=='solicita gestion terreno' and @receipt.profile_create==3)
      @cancellation = Cancellation.where("id=1")
      @msg_anula = @cancellation.first.message
    end 
    #----- Fin Mensajes para anulaciones -------
  end

  # PUT /receipts/1
  def update
    @titulo = "Editar Recibo de Pago"
    @receipt = Receipt.find(params[:id])
    @tickets = Ticket.where("receipt_id=?", @receipt.id)
    @button = params[:button]
    #----------
    @mandante = @tickets.first.principal_id
    @producto = @tickets.first.product_id
    @tipo_cobranza = @tickets.first.collection_type_id
    @formas  = Array.new
    @pay_p = PaymentPolicy.where("principal_id =?", @mandante).where("product_id =?", @producto).where("collection_type_id =?", @tipo_cobranza)
    if @pay_p.empty?
      @payment_form_list = PaymentFormsPaymentPolicies.all
    else
      @ppid = @pay_p.first.id
      @payment_form_list = PaymentFormsPaymentPolicies.where("payment_policy_id=?", @ppid)
    end
    @payment_form_list.each do |pf|
      @formas << pf.payment_form_id
    end
    #------------
    #----- Mensajes para anulaciones -------
    if (@button=="n2" and @receipt.state=="abierto" and @receipt.payment_flow_id==2)
      @cancellation = Cancellation.where("id=2")
      @msg_anula = @cancellation.first.message
    elsif (@button=="n3" and @receipt.state=='recibido rechazo')
      @cancellation = Cancellation.where("id=3")
      @msg_anula = @cancellation.first.message
    elsif (@button=="n1" and @receipt.state=='solicita gestion terreno' and @receipt.profile_create==3)
      @cancellation = Cancellation.where("id=1")
      @msg_anula = @cancellation.first.message
    end 
    #----- Fin Mensajes para anulaciones -------
    if @receipt.update_attributes(params[:receipt])
      if params[:terr_button] 
        @receipt.update_attribute 'state', "abierto"
        @receipt.update_attribute 'area', "Terreno"
        @receipt.update_attribute 'subarea', ""
        redirect_to(@receipt, :notice => 'El Recibo de Pago se encuentra listo para ser impreso y ser enviado a terreno.')
        #  redirect_to(:action => "ntc", :acc => 'terr_button', :id => @receipt.id )
      elsif params[:cerrar_button]       
       if (@receipt.state=="abierto") and @receipt.valid? and @button!="m"
         @total_paid = 0
         @total_paid = (not @receipt.monto1.nil?) ? @total_paid + @receipt.monto1 : @total_paid
         @total_paid = (not @receipt.monto2.nil?) ? @total_paid + @receipt.monto2 : @total_paid
         @total_paid = (not @receipt.monto3.nil?) ? @total_paid + @receipt.monto3 : @total_paid
         @total_paid = (not @receipt.monto4.nil?) ? @total_paid + @receipt.monto4 : @total_paid
         @total_paid = (not @receipt.monto5.nil?) ? @total_paid + @receipt.monto5 : @total_paid
         @total_paid = (not @receipt.monto6.nil?) ? @total_paid + @receipt.monto6 : @total_paid
         @total_paid = (not @receipt.monto7.nil?) ? @total_paid + @receipt.monto7 : @total_paid
         @total_paid = (not @receipt.monto8.nil?) ? @total_paid + @receipt.monto8 : @total_paid
         @total_paid = (not @receipt.monto9.nil?) ? @total_paid + @receipt.monto9 : @total_paid
         @total_paid = (not @receipt.monto10.nil?) ? @total_paid + @receipt.monto10 : @total_paid
         @total_paid = (not @receipt.monto11.nil?) ? @total_paid + @receipt.monto11 : @total_paid
         @total_paid = (not @receipt.monto12.nil?) ? @total_paid + @receipt.monto12 : @total_paid
         @total_paid = (not @receipt.monto13.nil?) ? @total_paid + @receipt.monto13 : @total_paid
         @total_paid = (not @receipt.monto14.nil?) ? @total_paid + @receipt.monto14 : @total_paid
         @total_paid = (not @receipt.monto15.nil?) ? @total_paid + @receipt.monto15 : @total_paid
         @total_paid = (not @receipt.monto16.nil?) ? @total_paid + @receipt.monto16 : @total_paid
         @total_paid = (not @receipt.monto17.nil?) ? @total_paid + @receipt.monto17 : @total_paid
         @total_paid = (not @receipt.monto18.nil?) ? @total_paid + @receipt.monto18 : @total_paid
         @receipt.update_attribute 'total_paid', @total_paid  
         @receipt.update_attribute 'state', 'cerrado' 
         if current_user.profile_id == 2  # Supervisor 
           @receipt.update_attribute 'area', 'Supervisor'
         elsif current_user.profile_id == 6  # Gerencia 
           @receipt.update_attribute 'area', 'Gerencia'
         end   
         redirect_to(@receipt, :notice => 'El Recibo de Pago se ha cerrado exitosamente y se encuentra listo para ser rendido.') 
       else
         redirect_to(@receipt, :notice => 'El Recibo de Pago se ha actualizado exitosamente.') 
       end
      elsif params[:rech_jtr_button] 
        if @receipt.profile_create==1 
          @receipt.update_attribute 'area', "Cobranza"
        elsif @receipt.profile_create==2 
          @receipt.update_attribute 'area', "Supervisor"
        elsif @receipt.profile_create==6 
          @receipt.update_attribute 'area', "Gerencia"
        end
        @receipt.update_attribute 'state', "recibido rechazo"
        @receipt.update_attribute 'subarea', "Terreno"
        @receipt.update_attribute 'et_name', nil        
        @receipt.update_attribute 'rech_by', current_user.name 
        @receipt.update_attribute 'rech_date', Time.now 
        redirect_to(:action => "ntc", :acc => 'rech_button', :id => @receipt.id )
      elsif params[:correg_trr_button] and @receipt.valid?
         @receipt.update_attribute 'state', 'solicita gestion terreno' 
         @receipt.update_attribute 'area', 'Terreno' 
         @receipt.update_attribute 'subarea', 'Cobranza' 
         @receipt.update_attribute 'rech_mtvo', "" 
         @receipt.update_attribute 'rejection_type_id', "" 
         redirect_to(@receipt, :notice => 'El Recibo de Pago se ha corregido exitosamente y se encuentra listo para ser enviado a Terreno.') 
      elsif params[:correg_sup_button] and @receipt.valid?
         @receipt.update_attribute 'state', 'cerrado' 
         @receipt.update_attribute 'area', 'Cobranza' 
         @receipt.update_attribute 'subarea', '' 
         @receipt.update_attribute 'rech_mtvo', "" 
         @receipt.update_attribute 'rejection_type_id', "" 
         redirect_to(@receipt, :notice => 'El Recibo de Pago se ha corregido exitosamente y se encuentra listo para ser rendido a Supervisor.') 
      elsif params[:correg_trr_sup_button] and @receipt.valid?
         @receipt.update_attribute 'state', 'cerrado' 
         @receipt.update_attribute 'area', 'Terreno' 
         @receipt.update_attribute 'subarea', '' 
         @receipt.update_attribute 'rech_mtvo', "" 
         @receipt.update_attribute 'rejection_type_id', "" 
         redirect_to(@receipt, :notice => 'El Recibo de Pago se ha corregido exitosamente y se encuentra listo para ser rendido a Supervisor.') 
      elsif params[:correg_trr_tsr_button] and @receipt.valid?
         @receipt.update_attribute 'state', 'cerrado' 
         @receipt.update_attribute 'area', 'Terreno' 
         @receipt.update_attribute 'subarea', '' 
         @receipt.update_attribute 'rech_mtvo', "" 
         @receipt.update_attribute 'rejection_type_id', "" 
         redirect_to(@receipt, :notice => 'El Recibo de Pago se ha corregido exitosamente y se encuentra listo para ser rendido a Tesoreria.')  
      elsif params[:correg_sup_tsr_button] and @receipt.valid?
         @receipt.update_attribute 'state', 'cerrado' 
         @receipt.update_attribute 'area', 'Supervisor' 
         @receipt.update_attribute 'subarea', '' 
         @receipt.update_attribute 'rech_mtvo', "" 
         @receipt.update_attribute 'rejection_type_id', "" 
         redirect_to(@receipt, :notice => 'El Recibo de Pago se ha corregido exitosamente y se encuentra listo para ser rendido a Tesoreria.') 
      elsif params[:correg_ger_tsr_button] and @receipt.valid?
         @receipt.update_attribute 'state', 'cerrado' 
         @receipt.update_attribute 'area', 'Gerencia' 
         @receipt.update_attribute 'subarea', '' 
         @receipt.update_attribute 'rech_mtvo', "" 
         @receipt.update_attribute 'rejection_type_id', "" 
         redirect_to(@receipt, :notice => 'El Recibo de Pago se ha corregido exitosamente y se encuentra listo para ser rendido a Tesoreria.') 
      elsif params[:s_anular1_button] and @receipt.valid?
          @receipt.update_attribute 'state', 'solicita anulacion' 
          @receipt.update_attribute 'subarea', 'Supervisor' 
          @receipt.update_attribute 'cancellation_id', '1' 
          @receipt.update_attribute 'canc_solc_by', current_user.name 
          redirect_to(:action => "ntc", :acc => 's_anular_button', :id => @receipt.id )
      elsif params[:s_anular2_button] and @receipt.valid?
          @receipt.update_attribute 'state', 'solicita anulacion' 
          @receipt.update_attribute 'subarea', 'Supervisor' 
          @receipt.update_attribute 'cancellation_id', '2' 
          @receipt.update_attribute 'canc_solc_by', current_user.name 
          redirect_to(:action => "ntc", :acc => 's_anular_button', :id => @receipt.id )
      elsif params[:s_anular3_button] and @receipt.valid?
          @receipt.update_attribute 'state', 'solicita anulacion' 
          @receipt.update_attribute 'subarea', 'Supervisor' 
          @receipt.update_attribute 'cancellation_id', '3' 
          @receipt.update_attribute 'canc_solc_by', current_user.name 
          redirect_to(:action => "ntc", :acc => 's_anular_button', :id => @receipt.id )
      elsif params[:anular2_button] and @receipt.valid?
          @receipt.update_attribute 'cancellation_id', '2' 
          @receipt.update_attribute 'canc_solc_by', current_user.name 
          redirect_to(:action => "ntc", :acc => 'anula_sup', :id => @receipt.id )
      elsif params[:anular_button] and  @receipt.valid?
          @receipt.update_attribute 'cancellation_id', '3' 
          @receipt.update_attribute 'canc_solc_by', current_user.name 
          redirect_to(:action => "ntc", :acc => 'anula_sup', :id => @receipt.id )
      elsif params[:anular1_button] and  @receipt.valid?
          @receipt.update_attribute 'cancellation_id', '1' 
          @receipt.update_attribute 'canc_solc_by', current_user.name 
          redirect_to(:action => "ntc", :acc => 'anula_sup', :id => @receipt.id )
      elsif params[:rech_sup_ejc_button] and @receipt.valid?
          @receipt.update_attribute 'state', 'rechazado' 
          @receipt.update_attribute 'subarea', 'Cobranza' 
          @receipt.update_attribute 'rech_by', current_user.name 
          @receipt.update_attribute 'rech_date', Time.now 
          redirect_to(:action => "ntc", :acc => 'rech_button', :id => @receipt.id )
      elsif params[:rech_sup_terr_button] and @receipt.valid?
          @receipt.update_attribute 'state', 'rechazado' 
          @receipt.update_attribute 'subarea', 'Terreno' 
          @receipt.update_attribute 'rech_by', current_user.name 
          @receipt.update_attribute 'rech_date', Time.now 
          redirect_to(:action => "ntc", :acc => 'rech_button', :id => @receipt.id )
      elsif params[:rech_tsr_button] 
          @receipt.update_attribute 'state', 'rechazado' 
          @receipt.update_attribute 'subarea', 'Supervisor' 
          @receipt.update_attribute 'rech_by', current_user.name 
          @receipt.update_attribute 'rech_date', Time.now 
          redirect_to(:action => "ntc", :acc => 'rech_button', :id => @receipt.id )
      elsif params[:rech_tsr_trr_button] 
          @receipt.update_attribute 'state', 'rechazado' 
          @receipt.update_attribute 'subarea', 'Terreno' 
          @receipt.update_attribute 'rech_by', current_user.name 
          @receipt.update_attribute 'rech_date', Time.now 
          redirect_to(:action => "ntc", :acc => 'rech_button', :id => @receipt.id )
      elsif params[:rech_tsr_ger_button] 
          @receipt.update_attribute 'state', 'rechazado' 
          @receipt.update_attribute 'subarea', 'Gerencia' 
          @receipt.update_attribute 'rech_by', current_user.name 
          @receipt.update_attribute 'rech_date', Time.now 
          redirect_to(:action => "ntc", :acc => 'rech_button', :id => @receipt.id )
      elsif params[:grabar_button] and @receipt.valid?
          redirect_to(:action => "ntc", :acc => 'actualiza_button', :id => @receipt.id )
      elsif params[:ajustar_button]
        if @receipt.valid?
          if not @receipt.adjust_val.nil?
            @ticket = Ticket.where("id=?", @receipt.adjust_ticket)
            @parm1 = Parameter.where("id=2") 
            @parm1.each do |p|
              @ajuste_mx = p.val_int  
            end
            @ticket.each do |p|
              @descuento = @receipt.adjust_val + p.adjust_val 
              #@valor =  @ajuste_mx - p.adjust_val
              if @descuento < @ajuste_mx
                @receipt.update_attribute 'adjust_val', ""
                redirect_to(:action => "edit", :id => @receipt.id, :msg=>"1")
              else
               p.update_attribute 'new_total_pay', p.total_pay + @receipt.adjust_val+ p.adjust_val
               p.update_attribute 'adjust_trr_val', @receipt.adjust_val 
               p.update_attribute 'adjust_trr_obs', @receipt.adjust_obs 
               p.update_attribute 'adjust_time', Time.now
               p.update_attribute 'adjust_by', current_user.name
               @tickets = Ticket.where("receipt_id=?", @receipt.id)
               @total_rp = 0
               @tickets.each do |a|
                 if a.new_total_pay.nil?
                   @total_rp = @total_rp + a.total_pay
                 else
                   @total_rp = @total_rp + a.new_total_pay
                 end
               end
               @receipt.update_attribute 'total_pay', @total_rp
               redirect_to(@receipt, :notice => 'El Recibo de Pago ha actualizado correctamente.')
              end
            end
          else
            redirect_to(:action => "edit", :id => @receipt.id, :msg=>"2")
          end
        end
      end
    else
      render :action => "edit" 
    end
  end

  def rp_abtos # lisra
    deny_access unless (current_user.profile_id==1 or current_user.profile_id==2 or current_user.profile_id==3 or current_user.profile_id==6 or current_user.profile_id==8)
    @titulo = "Cerrar Recibos de Pago"
    if current_user.profile_id==6
      @receipts = Receipt.where("state='abierto'").where("payment_flow_id=2")
    else
      @receipts = Receipt.where("state='abierto'").where("payment_flow_id=2").where("user_name=?",current_user.name)
    end
  end

  def print
   deny_access unless (current_user.profile_id==1 or current_user.profile_id==2 or current_user.profile_id==3 or current_user.profile_id==6 or current_user.profile_id==8)
    @receipt = Receipt.find(params[:id])
    @tickets = Ticket.where("receipt_id=?", @receipt.id)
    @rconforme = false
    @tickets.each do |a|
      if a.doc_delivery
        @rconforme = true
      end
    end
    # @receipt.num_print.nil? ? @num_print=1 : @num_print=@receipt.num_print 
    #@receipt.update_attribute 'print_user', current_user.name
    #@receipt.update_attribute 'print_date', Time.now
  end

  def destroy
  end

  def sort_column  
    params[:sort] || "id"  
  end  
  def sort_direction  
    params[:direction] || "asc"  
  end  

  private
    def perfil_name
     if current_user.profile_id==1 
        @perfil_name = "Ejecutivo de Cobranza"
      elsif current_user.profile_id==2
        @perfil_name = "Supervisor"
      elsif current_user.profile_id==3
        @perfil_name = "Jefe de Terreno"
      elsif current_user.profile_id==4
        @perfil_name = "Tesoreria"
      elsif current_user.profile_id==5
        @perfil_name = "Operador"
      elsif current_user.profile_id==6
        @perfil_name = "Gerencia"
      elsif current_user.profile_id==8
        @perfil_name = "Designer"
      end 
    end
end
