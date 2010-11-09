require 'spec_helper'

describe PaymentForm do
  before(:each) do
    @attr = { :name => "Nombre Forma de Pago"}
  end  
  it "debe crear una nueva instancia dando atributos validos" do
    PaymentForm.create!(@attr)
  end 

  it "se requiere ingresar name" do
    sin_name = PaymentForm.new(@attr.merge(:name => ""))
    sin_name.should_not be_valid
  end
end
