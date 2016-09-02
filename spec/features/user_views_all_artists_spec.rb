require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see the names of all of the artists with links" do
    artist1 = Artist.create(name: "Kurt Cobain", image_path: "http://www.mtv.com/crop-images/2013/08/19/kurt_cobain.jpg")
    artist2 = Artist.create(name: "Billy Idol", image_path: "https://s-media-cache-ak0.pinimg.com/564x/30/d9/54/30d9547012acf0d7788307b3ce645993.jpg")
    artist3 = Artist.create(name: "Buck65", image_path: "http://65.media.tumblr.com/2f1c18584db6d3d83459fcb882f7c53d/tumblr_inline_mn6lluDiK31qz4rgp.jpg")

    visit artist_path

    artists.each do |artist|
      expect(page).to have_link artist_name, href: artist_path(artist)
    end
  end
end

# As a user
# Given that artists exist in the database
# When I visit the artists index
# Then I should see each artist's name
# And each name should link to that artist's individual page
