class Listing < ApplicationRecord
  has_many :biddings
  belongs_to :user
end
