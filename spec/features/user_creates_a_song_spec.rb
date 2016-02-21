require 'rails_helper'

RSpec.feature "User creates a song" do
  scenario "sees song page for specific song" do
    artist = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist)
    click_on "New song"
    fill_in "song_title", with: "Is This Love"
    click_on "Create Song"

    expect(page).to have_content "Is This Love"
    expect(page).to have_link artist.name, href: artist_path(artist)
  end

  scenario "without a title" do
    artist = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist)
    click_on "New song"
    click_on "Create Song"

    expect(page).to have_content "Title can't be blank"
  end
end
