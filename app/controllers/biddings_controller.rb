class BiddingsController < ApplicationController
  def index
    @biddings = Bidding.all
  end

  def new
    @bidding = Bidding.new(bidding_params)
    @auction = Auction.find(params[:auction_id])
  end

  def create
    raise
    @bidding = Bidding.new(bidding_params)
    @auction = Auction.find(params[:auction_id])
    @bidding.user = current_user
    if @bidding.save
      update_auction
      redirect_to listings_paths, notice: "Bid Submitted!"
    else
      render :new
    end
  end

  private

  def bidding_params
    params.require(:bidding).permit(:price, :incentive, :auction_id)
  end

  def update_auction
    @auction.current_price = @bidding.price
    @auction.save!
  end
end
