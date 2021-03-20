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
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def show
    @auction = Auction.find(params[:id])
    authorize @auction
    @biddings = @auction.biddings
    @bidding = Bidding.new
    @listing = @auction.listing
    @auction.current_price = @listing.min_price
    @auction.save!
  end

  private

  def auction_params
    params.permit(:current_price, :confirmation, :listing_id)
  end
end
