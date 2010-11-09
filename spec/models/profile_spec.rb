require 'spec_helper'

describe Profile do
  before(:each) do
    @attr = { :name => "Nombre Perfil"}
  end  
  it "debe crear una nueva instancia dando atributos validos" do
    Profile.create!(@attr)
  end 

  it "se requiere ingresar name" do
    sin_name = Profile.new(@attr.merge(:name => ""))
    sin_name.should_not be_valid
  end

end
