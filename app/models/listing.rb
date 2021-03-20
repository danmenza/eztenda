class Listing < ApplicationRecord
  has_many :biddings
  belongs_to :user
  has_one_attached :photo
end
