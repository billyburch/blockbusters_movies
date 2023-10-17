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

  #Active Record

  describe "User Story 6, blockbuster Index sorted by Most Recently Created" do
    describe "As a visitor" do
      describe "When I visit the blockbuster index," do
        it "I see that records are ordered by most recently created first, and next to each of the records, I see when it was created" do
          #Arrange/Given
            #before(:each)

          #Act/When
          visit "/blockbusters/"
          #Assert/Then
          expect(@blockbuster1.name).to appear_before(@blockbuster2.name)
          expect(@blockbuster2.name).to appear_before(@blockbuster3.name)
          expect(page).to have_content(@blockbuster1.created_at)
          expect(page).to have_content(@blockbuster2.created_at)
          expect(page).to have_content(@blockbuster3.created_at)
        end
      end
    end
  end

  describe "User Story 7, blockbuster movie Count" do
    describe "As a visitor" do
      describe "When I visit a blockbuster's show page" do
        it "I see a count of the number of movies associated with this blockbuster" do
          #Arrange/Given
            #before(:each)
          #Act/When
          visit "blockbusters/#{@blockbuster1.id}"
          #Assert/Then
          expect(page).to have_content("Total Movies in Stock: #{@blockbuster1.movies.count}")
        end
      end
    end
  end

  #Usability

  describe "User Story 8, movie Index Link" do
    describe "As a visitor" do
      describe "When I visit any page on the site" do
        it "Then I see a link at the top of the page that takes me to the movie Index" do
          #Arrange/Given
            #before(:each)     
          #Act/When +
          #Assert/Then
          visit "/"

          expect(page).to have_link("Movie Index")
          click_link("Movie Index")
          expect(current_path).to eq("/movies")

          visit "/movies"

          expect(page).to have_link("Movie Index")
          click_link("Movie Index")
          expect(current_path).to eq("/movies")

          visit "/movies/#{@movie1.id}"
          
          expect(page).to have_link("Movie Index")
          click_link("Movie Index")
          expect(current_path).to eq("/movies")
          
          visit "/movies/#{@movie2.id}"

          expect(page).to have_link("Movie Index")
          click_link("Movie Index")
          expect(current_path).to eq("/movies")

          visit "/blockbusters"

          expect(page).to have_link("Movie Index")
          click_link("Movie Index")
          expect(current_path).to eq("/movies")

          visit "/blockbusters/#{@blockbuster1.id}"

          expect(page).to have_link("Movie Index")
          click_link("Movie Index")
          expect(current_path).to eq("/movies")

          visit "/blockbusters/#{@blockbuster2.id}"

          expect(page).to have_link("Movie Index")
          click_link("Movie Index")
          expect(current_path).to eq("/movies")

          visit "/blockbusters/#{@blockbuster3.id}" 

          expect(page).to have_link("Movie Index")
          click_link("Movie Index")
          expect(current_path).to eq("/movies")
        end
      end
    end
  end

  describe "User Story 9, blockbuster Index Link" do
    describe "As a visitor" do
      describe "When I visit any page on the site" do
        it "Then I see a link at the top of the page that takes me to the blockbuster Index" do
          #Arrange/Given
            #before(:each)     
          #Act/When +
          #Assert/Then
          visit "/"

          expect(page).to have_link("Blockbuster Store Index")
          click_link("Blockbuster Store Index")
          expect(current_path).to eq("/blockbusters")

          visit "/movies"

          expect(page).to have_link("Blockbuster Store Index")
          click_link("Blockbuster Store Index")
          expect(current_path).to eq("/blockbusters")

          visit "/movies/#{@movie1.id}"
          
          expect(page).to have_link("Blockbuster Store Index")
          click_link("Blockbuster Store Index")
          expect(current_path).to eq("/blockbusters")
          
          visit "/movies/#{@movie2.id}"

          expect(page).to have_link("Blockbuster Store Index")
          click_link("Blockbuster Store Index")
          expect(current_path).to eq("/blockbusters")

          visit "/blockbusters"

          expect(page).to have_link("Blockbuster Store Index")
          click_link("Blockbuster Store Index")
          expect(current_path).to eq("/blockbusters")

          visit "/blockbusters/#{@blockbuster1.id}"

          expect(page).to have_link("Blockbuster Store Index")
          click_link("Blockbuster Store Index")
          expect(current_path).to eq("/blockbusters")

          visit "/blockbusters/#{@blockbuster2.id}"

          expect(page).to have_link("Blockbuster Store Index")
          click_link("Blockbuster Store Index")
          expect(current_path).to eq("/blockbusters")

          visit "/blockbusters/#{@blockbuster3.id}" 

          expect(page).to have_link("Blockbuster Store Index")
          click_link("Blockbuster Store Index")
          expect(current_path).to eq("/blockbusters")
        end
      end
    end
  end

  describe "User Story 10, blockbuster movie Index Link" do
    describe "As a visitor" do
      describe "When I visit a blockbuster show page ('/blockbusters/:id')" do
        it "Then I see a link to take me to that blockbuster's `movie_table_name` page ('/blockbusters/:id/movie_table_name')" do
          #Arrange/Given
            #before(:each)     
          #Act/When +
          visit "/blockbusters/#{@blockbuster1.id}"
          #Assert/Then
          expect(page).to have_link("Movie Index")
          click_link("Movie Index")
          expect(current_path).to eq("/movies")
        end
      end
    end
  end

#The below is my attempt at returning JUST the store's movies - I don't think the above does so, and I'm out of time! 

  # describe "User Story 10, blockbuster movie Index Link" do
  #   describe "As a visitor" do
  #     describe "When I visit a blockbuster show page ('/blockbusters/:id')" do
  #       it "Then I see a link to take me to that blockbuster's `movie_table_name` page ('/blockbusters/:id/movie_table_name')" do
  #         #Arrange/Given
  #           #before(:each)     
  #         #Act/When +
  #         visit "/blockbusters/#{@blockbuster1.id}"
  #         #Assert/Then
  #         expect(page).to have_link("Movies at this Location")
  #         click_link("Movies at this Location")
  #         expect(current_path).to eq("/movies/#{@blockbuster1.id}")
  #       end
  #     end
  #   end
  # end
end