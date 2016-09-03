require 'rails_helper'

RSpec.feature "User edits an Artist" do
  scenario "they can update a name and see the updated info" do
    artist = Artist.create(name: "Kurt Cobain", image_path: "http://www.mtv.com/crop-images/2013/08/19/kurt_cobain.jpg")

    updated_name = "Curt Cobain"

    visit artist_path(artist)
    click_on "Edit"

    fill_in "artist_name", with: updated_name
    click_on "Update Artist"

    expect(page).to have_content updated_name
    expect(page).to_not have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")

    # And I click on "Edit"
    # And I fill in a new name
    # And I click on "Update Artist"
    # Then I should see the artist's updated name
    # Then I should see the existing image
  end


end
