class Assignment < ActiveRecord::Base
 belongs_to :principal
 belongs_to :product
 belongs_to :collection_type

 def self.search(search)
  if search
    where('rut LIKE ?', "%#{search}%").where("state = 'cargado'")

  else
    where("state = 'cargado'")
  end
 end
end
