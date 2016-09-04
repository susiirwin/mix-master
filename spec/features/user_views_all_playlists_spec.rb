require 'rails_helper'

RSpec.feature "User Views All Playlsts" do
  scenario "they see the names of all playlists" do
    playlists = create_list(:playlist_with_songs, 1)

    # Given that playlists exist in the database
    # When I visit the playlists index
    visit playlists_path
    # Then I should see each playlist's name
    # And each name should link to that playlist's individual page
    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end
  end
end
