require 'json'

class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :edit, :update, :destroy]

  # GET /favourites
  # GET /favourites.json
  def index

    search = params[:search]
    @images = []

    if search
      search_services = SearchService.new
      @images = search_services.fetch(search)
      @images = @images["results"]
    end
    @favourites = Favourite.all
  end

  # GET /favourites/1
  # GET /favourites/1.json
  def show
  end

  # GET /favourites/new
  def new
    @favourite = Favourite.new
  end

  # GET /favourites/1/edit
  def edit
  end

  # POST /favourites
  # POST /favourites.json
  def create
    @favourite = Favourite.new(favourite_params)

    respond_to do |format|
      if @favourite.save
        format.html { redirect_to action: :index, notice: 'Todo item was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favourites/1
  # PATCH/PUT /favourites/1.json
  def update
    respond_to do |format|
      if @favourite.update(favourite_params)
        format.html { redirect_to @favourite, notice: 'Favourite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favourite }
      else
        format.html { render :edit }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourites/1
  # DELETE /favourites/1.json
  def destroy
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_to favourites_url, notice: 'Favourite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favourite_params
      params.require(:favourite).permit(:external_id, :uri)
    end
end
