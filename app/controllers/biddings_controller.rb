class BiddingsController < ApplicationController
  def index
    @biddings = policy_scope(Bidding)
  end

  def new
    @bidding = Bidding.new(bidding_params)
    @auction = Auction.find(params[:auction_id])
    authorize @bidding
  end

  def create
    @bidding = Bidding.new(bidding_params)
    @auction = Auction.find(params[:auction_id])
    @bidding.user_id = current_user.id
    @bidding.auction_id = @auction.id
    authorize @bidding
    if @bidding.save!
      update_auction
      redirect_to auctions_path(@auction), notice: "Bid Submitted!"
    else
      render :new
    end
  end

  private

  def bidding_params
    params.require(:bidding).permit(:price, :incentive)
  end

  def update_auction
    @auction.current_price = @bidding.price
    @auction.save!
  end
end
