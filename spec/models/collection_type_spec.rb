require 'spec_helper'

describe CollectionType do
  before(:each) do
    @attr = { :name => "Nombre Tipo de Cobranza"}
  end  
  it "debe crear una nueva instancia dando atributos validos" do
    CollectionType.create!(@attr)
  end 

  it "se requiere ingresar name" do
    sin_name = CollectionType.new(@attr.merge(:name => ""))
    sin_name.should_not be_valid
  end
end
