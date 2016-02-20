require 'rails_helper'

RSpec.feature "User deletes and artist" do
  scenario "existing artist in database is deleted" do
    artist = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist.id)
    click_on "Delete"

    expect(page).to_not have_content "Bob Marley"
    expect(page).to_not have_css("img[src=\"#{artist.image_path}\"]")
  end
end
