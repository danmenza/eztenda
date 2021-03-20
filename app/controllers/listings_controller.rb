class ListingsController < ApplicationController
  def index
    @listings = policy_scope(Listing)
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def edit
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def update
    @listing = Listing.find(params[:id])
    authorize @listing
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing = Listing.find(params[:id])
    authorize @listing
    @listing.destroy
    redirect_to listings_path
  end

  def listing_params
    params.require(:listing).permit(:name, :quantity, :drink_category, :start_date, :end_date, :description, :min_price, :wholesaler, :photo, :marketing)
  end
end
