require 'rails_helper'

RSpec.feature "user views all artists" do
  scenario "they see all artists that exist in database" do
    artist1 = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    artist2 = Artist.create(name: "Johnny Cash", image_path: "http://static.tvtropes.org/pmwiki/pub/images/medium_JOHNNY_CASH_1.jpg")
    artist3 = Artist.create(name: "Elvis", image_path: "http://s3.amazonaws.com/rapgenius/1378760962_elvis-presley.jpg")
    artists = [artist1, artist2, artist3]
    visit artists_path

    artists.each do |artist|
    expect(page).to have_link artist.name, href: artist_path(artist)
    end
  end
end
