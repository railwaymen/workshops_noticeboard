class Post < ActiveRecord::Base
  attr_accessible :title, :content, :address, :tag_list
  acts_as_taggable
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
