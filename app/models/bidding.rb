class Bidding < ApplicationRecord
  belongs_to :auction
  belongs_to :user
end
