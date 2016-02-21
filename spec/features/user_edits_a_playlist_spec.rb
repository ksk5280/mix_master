require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "sees updated playlist name" do
    playlist = Playlist.create(name: "My Jams")
    song_one, song_two, song_three = create_list(:song, 3)

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: "Smooth Jazz"
    check("song-#{song_one.id}")
    uncheck("song-#{song_three.id}")
    click_on "Update Playlist"

    expect(page).to have_content "Smooth Jazz"
    expect(page).to_not have_content "My Jams"
  end
end
