class BiddingsController < ApplicationController
  def index
    @biddings = Bidding.all
  end

  def new
    @bidding = Bidding.new
  end

  def create
    @bidding = Bidding.new(bidding_params)
    @listing = Listing.find(params[:listing_id])
    @bidding.user = current_user
    if @bidding.save!
      redirect_to listings_path
    else
      render :new
    end
  end

  private

  def booking_params
    raise
  end
end
