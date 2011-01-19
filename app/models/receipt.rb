class Receipt < ActiveRecord::Base
  belongs_to :payment_agreement
#  belongs_to :payment_form
  belongs_to :comuna
end
