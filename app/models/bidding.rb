class Bidding < ApplicationRecord
  belongs_to :listing, dependent: :destroy
  belongs_to :user
end
