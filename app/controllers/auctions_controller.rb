class AuctionsController < ApplicationController
  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @bidding = Bidding.create
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
    @biddings = @auction.biddings
    @bidding = Bidding.create(user_id: current_user.id, auction_id: @auction.id, price: params[:bidding][:price], incentive: params[:bidding][:incentive])
    @auction.current_price = @bidding.price
    @auction.save!
  end

  private

  def auction_params
    params.permit(:current_price, :confirmation, :listing_id)
  end
end
