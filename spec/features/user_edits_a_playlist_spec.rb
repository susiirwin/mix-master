require 'rails_helper'

RSpec.feature "User Edits a Playlist" do
  scenario "they see the new song and do not see the removed song" do
    playlist = create(:playlist_with_songs)
    song1, song2, song3 = playlist.songs
    song4 = create(:song, title: "Here I Go Again")

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: playlist.name
    uncheck("song-#{song1.id}")
    check("song-#{song4.id}")
    click_on "Update Playlist"
    expect(page).to have_content playlist.name
    expect(page).to have_content song4.title
    expect(page).to_not have_content song1.title

  end
end
