class Recibo < ActiveRecord::Migration
  change_table :receipts do |t| 
    t.rename :payment_agreement, :payment_agreement_name 
  end

end
