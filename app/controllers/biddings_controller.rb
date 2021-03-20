class BiddingsController < ApplicationController
  def index
    @biddings = policy_scope(Bidding)
  end

  def new
    raise
    @bidding = Bidding.new(bidding_params)
    @auction = Auction.find(params[:auction_id])
    authorize @bidding
  end

  def create
    raise
    @auction = Auction.find(params[:auction_id])
    @bidding.user = current_user
    @bidding = Bidding.new(bidding_params)
    authorize @bidding
    if @bidding.save!
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
