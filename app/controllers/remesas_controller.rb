class RemesasController < ApplicationController
  before_filter :perfil_name

  def new2 
      @arrear_interest = params[:t_arrear_interest]
      @term_interest = params[:t_term_interest]
      @fee = params[:t_fee]
      @shipping_costs = params[:t_shipping_costs]
      @legal_costs = params[:t_legal_costs]

      session[:receipt_ids] = params[:receipt_ids]
      @receipts = Receipt.find(params[:receipt_ids])
      @principal_reason_social = @receipts.first.principal.social_reason 
      @principal_id = @receipts.first.principal_id 
      @product_id = @receipts.first.product_id
      @product_name = @receipts.first.product.name
      @titulo = "Remesar"
      @remesa = Remesa.new
  end
  def new
    @remesa = Remesa.new
  end
  def create
    @remesa = Remesa.new(params[:remesa])
    if @remesa.save
      @remesa.update_attribute 'create_by', current_user.name
      redirect_to(@remesa, :notice => 'Remesa was successfully created.') 
    else
      render :action => "new" 
    end
  end

  def index
    @remesas = Remesa.all
  end

  def show
    @remesa = Remesa.find(params[:id])
    @titulo = "Remesa"
#@test = Array.new
@test = @remesa.test
  end

  def edit
    @remesa = Remesa.find(params[:id])
  end

  def update
    @remesa = Remesa.find(params[:id])

    respond_to do |format|
      if @remesa.update_attributes(params[:remesa])
        format.html { redirect_to(@remesa, :notice => 'Remesa was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @remesa.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @remesa = Remesa.find(params[:id])
    @remesa.destroy

    respond_to do |format|
      format.html { redirect_to(remesas_url) }
      format.xml  { head :ok }
    end
  end

  private
    def perfil_name
      if current_user.profile_id==4
        @perfil_name = "Tesoreria"
      elsif current_user.profile_id==6
        @perfil_name = "Gerencia"
      elsif current_user.profile_id==8
        @perfil_name = "Designer"
      end 
    end

end
