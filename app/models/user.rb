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
  attr_accessor :password
  belongs_to :profile
  belongs_to :group

  validates_presence_of :user, :message => "(Usuario) : debe ingresar un valor en este campo."
  validates_uniqueness_of :user, :case_sensitive => false, :message => "(Usuario) : el usuario ya existe."
  validates_presence_of :profile_id, :message => "(Perfil) : debe seleccionar un valor para este campo."
  validates_presence_of :group_id, :message => "(Grupo) : debe seleccionar un valor para este campo."
  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => ": la direccion de correo no es valida.", :allow_blank => true 
  validates_presence_of :password, :message => " : debe ingresar un valor en este campo."
  # Creación automática del atributo virtual 'password_confirmation'.
  validates_confirmation_of :password, :confirmation => true, :message => " : No coincide confirmacion de Password."

  before_save :encrypt_password

  # Devuelve verdadero si la password del usuario coincide con la password presentada.
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  def self.authenticate(user, submitted_password)
    user = find_by_user(user)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  private
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
