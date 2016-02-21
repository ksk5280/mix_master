class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end

  def show
    find_playlist
  end

  def edit
    find_playlist
  end

  def update
    find_playlist
    if @playlist.update(playlist_params)
      redirect_to @playlist
    else
      render :index
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end
end
