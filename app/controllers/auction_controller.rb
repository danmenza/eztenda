class AuctionController < ApplicationController
  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user
    @auction.listing = Listing.find(params[:listing_id])
    if @auction.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @bid = Bid.new(auction: @auction)
    @bids = @auction.bids
  end

  private

  def auction_params
    params.require(:auction).permit(:current_price, :confirmation, :listing_id)
  end
end
