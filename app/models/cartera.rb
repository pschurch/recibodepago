class Cartera < ActiveRecord::Base
  belongs_to :principal
  belongs_to :product
end
