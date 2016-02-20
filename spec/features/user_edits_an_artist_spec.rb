require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "an artist exists in the database and name is updated" do
    artist = Artist.create(name: "Joe", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist.id)

    click_on "Edit"
    fill_in "artist_name", with: "Bob Marley"
    click_on "Update Artist"
    expect(page).to have_content "Bob Marley"
    expect(page).to_not have_content "Joe"
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
