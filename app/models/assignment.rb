class Assignment < ActiveRecord::Base
 belongs_to :principal
 belongs_to :product

 def self.search(search)
  if search
    find(:all, :conditions => ['rut LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
 end
end
