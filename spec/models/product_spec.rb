require 'spec_helper'

describe Product do
  before(:each) do
    @attr = { :name => "Nombre Producto"}
  end  
  it "debe crear una nueva instancia dando atributos validos" do
    Product.create!(@attr)
  end 

  it "se requiere ingresar name" do
    sin_name = Product.new(@attr.merge(:name => ""))
    sin_name.should_not be_valid
  end
end
