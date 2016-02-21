class SongsController < ApplicationController
  def new
    find_artist
    @song = @artist.songs.new
  end

  def create
    find_artist
    @song = @artist.songs.create(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
