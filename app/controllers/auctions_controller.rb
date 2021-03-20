class AuctionsController < ApplicationController
  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @bidding = Bidding.new
    @auction.listing = Listing.find(params[:listing_id])
    @auction.current_price = @auction.listing.price
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @bidding = Bidding.create!(user_id: current_user.id, auction_id: @auction.id)
    @biddings = @auction.biddings
  end

  private

  def auction_params
    params.permit(:current_price, :confirmation, :listing_id)
  end
end
