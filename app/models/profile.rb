# == Schema Information
# Schema version: 20101108205318
#
# Table name: profiles
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  state       :boolean(1)      default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Profile < ActiveRecord::Base
end
