class Listing < ApplicationRecord
  has_one :auction
  belongs_to :user
  has_one_attached :photo
end
