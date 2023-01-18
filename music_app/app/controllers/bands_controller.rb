class BandsController < ApplicationController
  before_action :set_band, only: %i[show edit update destroy]

  def set_band
    @band = Band.find_by(id: params[:id])
  end

  def index
    @bands = Band.all
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      redirect_to new_band_url
    end
  end

  def new
    @band = Band.new
  end

  def edit
    # @band = Band.find_by(id: params[:id])
  end

  def show
    # @band = Band.find_by(id: params[:id])
  end

  def update
    # @band = Band.find_by(id: params[:id])

    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      redirect_to edit_band_url
    end
  end

  def destroy
    # @band = Band.find_by(id: params[:id])

    if @band.destroy
      redirect_to bands_url
    else
      redirect_to band_url(@band)
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
