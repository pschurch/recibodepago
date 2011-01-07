# == Schema Information
# Schema version: 20101109022158
#
# Table name: products
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  state       :boolean(1)      default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  has_many :payment_policies
  has_many :assignments
  has_many :carteras
  has_many :principals, :through => :carteras

  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
end
