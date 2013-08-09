# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.

  Movie.create( movie)

  end
  #flunk "Unimplemented"
end


Then /I should see all movies sorted by (.*)/ do |order_by|
  sorted_movies = Movie.order(order_by)
  sorted_movies.each_cons(2) do |m1,m2|
    step "Then I should see \"#{m1.title}\" before \"#{m2.title}\""
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  #flunk "Unimplemented"

  #page.body (/#{e1}.*#{e2}/m)
  bleri = (page.body =~ /#{e1}.*#{e2}/m)
  bleri.should be_true

end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

Given /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb

  rating_list.split(',').each do |rating|
    uncheck ? step("I uncheck \"ratings_#{rating}\"") : step("I check \"ratings_#{rating}\"") 
  end
end