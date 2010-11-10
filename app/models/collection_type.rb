# == Schema Information
# Schema version: 20101110173633
#
# Table name: collection_types
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  state       :boolean(1)      default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#

class CollectionType < ActiveRecord::Base
  validates_presence_of :name, :message => "(Nombre) : debe ingresar un valor en este campo."
end

