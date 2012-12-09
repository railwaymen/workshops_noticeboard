class Post < ActiveRecord::Base
  attr_accessible :title, :content, :address
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
