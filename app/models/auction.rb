class Auction < ApplicationRecord
  belongs_to :listing
  belongs_to :bidding
end
