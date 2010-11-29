# == Schema Information
# Schema version: 20101125185012
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  user               :string(255)
#  name               :string(255)
#  telephone          :string(255)
#  email              :string(255)
#  description        :text
#  profile_id         :integer(4)
#  group_id           :integer(4)
#  state              :boolean(1)      default(TRUE)
#  encrypted_password :string(255)
#  salt               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class User < ActiveRecord::Base
  belongs_to :profile
  belongs_to :group

  validates_presence_of :user, :message => "(Usuario) : debe ingresar un valor en este campo."
  validates_uniqueness_of :user, :case_sensitive => false, :message => "(Usuario) : el usuario ya existe."
  validates_presence_of :profile_id, :message => "(Perfil) : debe seleccionar un valor para este campo."
  validates_presence_of :group_id, :message => "(Grupo) : debe seleccionar un valor para este campo."
  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => ": la direccion de correo no es valida.", :allow_blank => true 

end
