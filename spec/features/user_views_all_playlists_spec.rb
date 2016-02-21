require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "sees list of playlist names" do
    playlist1 = Playlist.create(name: "My Jams")
    playlist2 = Playlist.create(name: "Sweet Tunes")
    playlist3 = Playlist.create(name: "Happy Songs")
    playlists = [playlist1, playlist2, playlist3]
    visit playlists_path

    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist.id)
    end
  end
end
