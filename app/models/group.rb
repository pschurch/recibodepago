# == Schema Information
# Schema version: 20101125171156
#
# Table name: groups
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  state       :boolean(1)      default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Group < ActiveRecord::Base
#  attr_accessible :description, :name
 
  has_many :users
  has_many :cargrups
  has_many :carteras, :through => :cargrups
  has_many :receipts

  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."

end
