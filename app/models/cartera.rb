class Cartera < ActiveRecord::Base
  belongs_to :principal
  belongs_to :product
  has_many :cargrups
  has_many :groups, :through => :cargrups
end
