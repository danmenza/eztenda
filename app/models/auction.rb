class Auction < ApplicationRecord
  belongs_to :listing
  has_many :biddings
  has_many :users, through: :biddings
end
