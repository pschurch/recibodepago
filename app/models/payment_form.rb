# == Schema Information
# Schema version: 20101109211813
#
# Table name: payment_forms
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  state       :boolean(1)      default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#

class PaymentForm < ActiveRecord::Base
  has_and_belongs_to_many :payment_policies

  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
end
