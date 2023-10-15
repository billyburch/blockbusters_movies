require "rails_helper"

RSpec.describe 'the movies show page' do
  #As a visitor
  #When I visit /movies/1 (where 1 is the id of a movie in my db)
  #Then I see that movie's title, and store
  #And I do not see any of the other songs in my database

  it 'displays movie title' do
    blockbuster = Blockbuster.create!(name: "Huntsman Square", city: "Springfield, VA")
    movie = blockbuster.movies.create!(title: "It", description: "Scary clown flick")
    visit "/movies/#{movie.id}"
    expect(page).to have_content(movie.title)
  end

end