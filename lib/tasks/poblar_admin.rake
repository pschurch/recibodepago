require 'faker'

namespace :db do
  desc "Carga Usuarios."
  task :usuarioadmin => :environment do
    usuarioadmin
  end
end

def usuarioadmin
  User.create!(:user => "admin", :profile_id => 7, :group_id => 1, :name => "admin", :password => "admin", :password_confirmation => "admin", :telephone => "NA")

end

