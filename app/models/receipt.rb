class Receipt < ActiveRecord::Base
  belongs_to :payment_agreement
end
