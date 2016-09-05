require 'rails_helper'

RSpec.feature "User edits an existing song" do
  scenario "they see the song's updated name" do
    song = create(:song, title: "November Rain")
    updated_title = "Paradise City"

    visit song_path(song)
    click_on "Edit Song Details"

    fill_in "song_title", with: updated_title
    click_on "Update Song"

    expect(page).to have_content updated_title
    
  end
end
