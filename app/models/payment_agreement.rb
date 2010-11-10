# == Schema Information
# Schema version: 20101110000720
#
# Table name: payment_agreements
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  state       :boolean(1)      default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#

class PaymentAgreement < ActiveRecord::Base
  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
end
