# README

Iteration 1
CRUD

[x] done
User Story 1, blockbuster Index 

For each blockbuster table
As a visitor
When I visit '/blockbusters'
Then I see the name of each blockbuster record in the system

[x] done
User Story 2, blockbuster Show 

As a visitor
When I visit '/blockbusters/:id'
Then I see the blockbuster with that id including the blockbuster's attributes
(data from each column that is on the blockbuster table)

[x] done
User Story 3, movie Index 

As a visitor
When I visit '/movie_table_name'
Then I see each movie in the system including the movie's attributes
(data from each column that is on the movie table)

[ ] done
User Story 4, movie Show 

As a visitor
When I visit '/movie_table_name/:id'
Then I see the movie with that id including the movie's attributes
(data from each column that is on the movie table)

[ ] done
User Story 5, blockbuster movieren Index 

As a visitor
When I visit '/blockbusters/:blockbuster_id/movie_table_name'
Then I see each movie that is associated with that blockbuster with each movie's attributes
(data from each column that is on the movie table)

ActiveRecord

[ ] done
User Story 6, blockbuster Index sorted by Most Recently Created 

As a visitor
When I visit the blockbuster index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created

[ ] done
User Story 7, blockbuster movie Count

As a visitor
When I visit a blockbuster's show page
I see a count of the number of movieren associated with this blockbuster
Usability

[ ] done
User Story 8, movie Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the movie Index

[ ] done
User Story 9, blockbuster Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the blockbuster Index

[ ] done
User Story 10, blockbuster movie Index Link

As a visitor
When I visit a blockbuster show page ('/blockbusters/:id')
Then I see a link to take me to that blockbuster's `movie_table_name` page ('/blockbusters/:id/movie_table_name')

<!-- 

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
