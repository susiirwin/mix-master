require 'rails_helper'

RSpec.feature "User deletes an Artist" do
  scenario "they delete an artist and no longer sees the artist on the index page" do
    artist = Artist.create(name: "Kurt Cobain", image_path: "http://www.mtv.com/crop-images/2013/08/19/kurt_cobain.jpg")

    visit artist_path(artist)
    click_on "Delete"

    expect(page).to_not have_content artist.name
  end


  # Given that an artist exists in the database
  # When I visit that artist's show page
  # And I click on "Delete"
  # Then I should be back on the artist index page
  # Then I should not see the artist's name
  #
end
