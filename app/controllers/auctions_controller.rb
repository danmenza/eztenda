class AuctionsController < ApplicationController
  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    authorize @auction
    @bidding = Bidding.create
    authorize @bidding
    @auction.listing = Listing.find(params[:listing_id])
    @auction.current_price = @auction.listing.price
    if @auction.save
       auction_path(@auction)
    else
      render :new
    end
  end

  def index
    @auctions = policy_scope(Auction)
  end

  def show
    @auction = Auction.find(params[:id])
    authorize @auction
    @biddings = @auction.biddings
    @bidding = Bidding.new
  end

  private

  def auction_params
    params.permit(:current_price, :confirmation, :listing_id)
  end
end
