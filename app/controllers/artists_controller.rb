class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def show
    find_artist
  end

  def edit
    find_artist
  end

  def update
    find_artist
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :index
    end
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end
end
