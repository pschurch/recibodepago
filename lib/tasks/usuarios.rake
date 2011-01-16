require 'faker'

namespace :db do
  desc "Carga Usuarios."
  task :usuarios => :environment do
    usuarios
  end
end

def usuarios
  User.create!(:user => "admin", :profile_id => 7, :group_id => 1, :name => "admin", :password => "admin", :password_confirmation => "admin")

end

