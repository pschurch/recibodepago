class Assignment < ActiveRecord::Base
 def self.search(search)
  if search
    find(:all, :conditions => ['rut LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
 end
end
