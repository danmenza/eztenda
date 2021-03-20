class AuctionsController < ApplicationController
  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user
    @auction.listing = Listing.find(params[:listing_id])
    @auction.current_price = @auction.listing.price
    if @auction.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @biddings = Bidding.new
    @biddings = @auction.biddings
  end

  private

  def auction_params
    params.require(:auction).permit(:current_price, :confirmation, :listing_id)
  end
end
