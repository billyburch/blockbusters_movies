require "rails_helper"

RSpec.describe "Blockbusters Index", type: :feature do
  before(:each) do
    @blockbuster1 = Blockbuster.create!(name:"Huntsman Square", city:"Springfield", state:"Virginia", store_awards:12, rewards_program: true)
    @blockbuster2 = Blockbuster.create!(name:"Colfax", city:"Denver", state:"Colorado", store_awards:2, rewards_program: false)
    @blockbuster3 = Blockbuster.create!(name:"Folly Beach", city:"Charleston", state:"South Carolina", store_awards: 5, rewards_program: true)
    @movie1 = @blockbuster1.movies.create!(title:"It", description:"Spooky Clown", genre:"Horror", release_year: 2017, restricted: true)
    @movie2 = @blockbuster1.movies.create!(title:"Elf", description:"Charming Odyssey", genre:"Holiday Comedy", release_year: 2003, restricted: false)
  end

  describe "user story 1, Blockbuster Index" do
    describe "For each blockbuster table" do
      describe "as a visitor" do
        describe "when I visit /blockbusters" do
          it "then I see the name of each blockbuster record in the system" do
            #Arrange/Given
              #before(:each)
            #Act/When
            visit "/blockbusters"
            #Assert/Then
            expect(page).to have_content(@blockbuster1.name)
            expect(page).to have_content(@blockbuster2.name)
            expect(page).to have_content(@blockbuster3.name)
          end
        end
      end
    end
  end

  describe "User story 2, Blockbuster Show" do
    describe "As a visitor" do
      describe "When I visit '/blockbusters/:id'
      " do
        it "Then I see the blockbuster with that id including the blockbuster's attributes
        " do
          #Arrange/Given
            #before(:each)
          #Act/When
          visit "/blockbusters/#{@blockbuster1.id}"
          #Assert/Then
          expect(page).to have_content(@blockbuster1.name)
          expect(page).to have_content(@blockbuster1.city)
          expect(page).to have_content(@blockbuster1.state)
          expect(page).to have_content(@blockbuster1.store_awards)
          expect(page).to have_content(@blockbuster1.rewards_program)
        end
      end
    end
  end

  describe "User Story 3, Movie Index " do
    describe "As a visitor" do
      describe "When I visit '/movies'" do
        it "Then I see each Movie in the system including the Movie's attributes" do
          #Arrange/Given
            #before(:each)
          #Act/When
          visit "/movies"
          #Assert/Then
          expect(page).to have_content(@movie1.title)
          expect(page).to have_content(@movie1.description)
          expect(page).to have_content(@movie1.genre)
          expect(page).to have_content(@movie1.release_year)
          expect(page).to have_content(@movie1.restricted)

          expect(page).to have_content(@movie2.title)
          expect(page).to have_content(@movie2.description)
          expect(page).to have_content(@movie2.genre)
          expect(page).to have_content(@movie2.release_year)
          expect(page).to have_content(@movie2.restricted)
        end
      end
    end
  end

  describe "User Story 4, movie Show" do
    describe "As a visitor" do
      describe "When I visit '/movies/:id" do
        it "Then I see the movie with that id including the movie's attributes" do
          #Arrange/Given
            #before(:each)
          #Act/When
          visit "/movies/#{@movie1.id}"
          #Assert/Then
          expect(page).to have_content(@movie1.title)
          expect(page).to have_content(@movie1.description)
          expect(page).to have_content(@movie1.genre)
          expect(page).to have_content(@movie1.release_year)
          expect(page).to have_content(@movie1.restricted)      
        end
      end
    end
  end

  describe "User Story 5, Blockbuster Movie Index" do
    describe "As a visitor" do
      describe "When I visit '/blockbusters/:blockbuster_id/movies'" do
        it "Then I see each movie that is associated with that blockbuster with each movie's attributes" do
          #Arrange/Given
            #before(:each)
          #Act/When
          visit "/blockbusters/#{@blockbuster1.id}/movies"
          #Assert/Then
          expect(page).to have_content(@movie1.title)
          expect(page).to have_content(@movie1.description)
          expect(page).to have_content(@movie1.genre)
          expect(page).to have_content(@movie1.release_year)
          expect(page).to have_content(@movie1.restricted)

          expect(page).to have_content(@movie2.title)
          expect(page).to have_content(@movie2.description)
          expect(page).to have_content(@movie2.genre)
          expect(page).to have_content(@movie2.release_year)
          expect(page).to have_content(@movie2.restricted)        
        end
      end
    end
  end
end