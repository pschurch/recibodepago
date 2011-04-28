require 'faker'
namespace :db do
  desc "Carga los datos de Periodos de Pago."
  task :payperiod => :environment do
    payperiod
  end
end

def payperiod
  PaymentPeriod.create!(:name => "AT", :description => "Atrasado", :state => 1)
  PaymentPeriod.create!(:name => "NO", :state => 1)
  PaymentPeriod.create!(:name => "AD", :description => "Adelantado", :state => 1)
end

