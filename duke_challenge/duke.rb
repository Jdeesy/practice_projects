# Release 0 - Let's mock up Marissa's data. Last year, TSP went on one tour and played eight shows. Mock up some data for each show, including the following attributes: venue name, ticket price, venue capacity, actual attendance, CDs sold. 

show_1 = {venue_name: "Doug's Bar", ticket_price: 5, venue_capacity: 100, actual_attendance: 15, cds_sold: 1, cd_price: 5}
show_2 = {venue_name: "Steve's Bar", ticket_price: 6, venue_capacity: 150, actual_attendance: 35, cds_sold: 4, cd_price: 5}
show_3 = {venue_name: "Peter's Birthay Party", ticket_price: 0, venue_capacity: 40, actual_attendance: 20, cds_sold: 3, cd_price: 3}
show_4 = {venue_name: "Sidewalk", ticket_price: 0, venue_capacity: 20, actual_attendance: 20, cds_sold: 1, cd_price: 5}
show_5 = {venue_name: "Prom", ticket_price: 5, venue_capacity: 200, actual_attendance: 175, cds_sold: 0, cd_price: 5} 
show_6 = {venue_name: "Joe's Mom's Backyard", ticket_price: 5, venue_capacity: 35, actual_attendance: 10, cds_sold: 6, cd_price: 5}
show_7 = {venue_name: "Nursing Home", ticket_price: 1, venue_capacity: 100, actual_attendance: 100, cds_sold: 0, cd_price: 5}
show_8 = {venue_name: "Mom and Pop Coffee Shop", ticket_price: 5, venue_capacity: 50, actual_attendance: 15, cds_sold: 2, cd_price: 5}

# shows_array = [show_1, show_2, show_3, show_4, show_5, show_6, show_7, show_8]

# revenue_for_each_show = [] 
# shows_array.each{ |show| revenue_for_each_show << (show[:ticket_price] * show[:actual_attendance]) } 
# # p revenue_for_each_show
# total_revenue = revenue_for_each_show.reduce(:+)
# # p total_revenue
# tour = {total_revenue: total_revenue, total_expenses: 500, shows_info: shows_array}

# Release 1 - Let's figure out what classes we need to make this thing tick. Looking at the second sentence of Release 0 above, I see two nouns that sound a lot like the kind of things Marissa would like to see modeled in an app about her work. (And the band name isn't one of them!) 

# Nouns: tour, show
# We want to have a Tour class and a Show class these will be our models so we can make Tour/Show objects.

# Build classes for those two things. Think orange trees/oranges, or ovens/cookies, or hospital/employees here. Don't worry about behavior yet, just state, i.e. make sure any necessary instance variables are accounted for in your initialize methods before moving on. Your classes should expect hashes as arguments right from the start; bonus points if you can intuitively set some optional default values using Hash#fetch. 

class Show
  attr_reader :venue_name, :ticket_price, :venue_capacity, :actual_attendance, :cds_sold, :cd_price, :revenue

  def initialize(options)
    @venue_name = options[:venue_name]
    @ticket_price = options[:ticket_price]
    @venue_capacity = options[:venue_capacity]
    @actual_attendance = options[:actual_attendance]
    @cds_sold = options[:cds_sold]
    @cd_price = options[:cd_price]
    @revenue = (ticket_price * actual_attendance) + (cds_sold * cd_price)  
  end
end

class Tour
  attr_reader :total_revenue, :total_expenses, :total_profit, :shows_list
  attr_accessor :show_list

  def initialize(expenses = 0)
    @total_revenue = 0
    @total_expenses = expenses
    @total_profit = calculate_profit
    @shows_list = []
  end

  def add_show(options)
    show = Show.new(options)
    shows_list << show
  end

  def calculate_total_revenue
    revenue_for_each_show = [] 
    shows_list.each{ |show| revenue_for_each_show << show.revenue }
    @total_revenue = revenue_for_each_show.reduce(:+)
  end

  def calculate_profit
    @total_profit = total_revenue - total_expenses
  end
end

new_tour = Tour.new
p new_tour # should return like a hash, Tour class with object ID then revnue,expenses,profit, and show list
new_tour.add_show(show_1)
new_tour.calculate_total_revenue
new_tour.calculate_profit
p new_tour
# (Skills: Modeling real-world objects as classes, naming variables descriptively and concisely, preventing argument order dependency)

# Release 2 - Here's the fun part: let's dip our toes into behavior! Let's assume, for simplicity's sake, that it's a tour's job to add shows to its schedule. Write an instance method for a tour that takes your hash array from Release 0 as an argument and iterates over it, creating new show objects and adding them to a collection that belongs to that tour.

# Then think about the kinds of messages a tour and a show might need to pass back and forth. Will you need to make use of any attr_reader/writer/accessors? Implement only the ones you need for the attributes you'll need access to. If you plan to implement a to_s method in the Show class, that should smell like a need for at least a couple readers. If a Tour object needs to modify one of its shows' ticket prices, what kind of access will you need to write into the Show class?

# Run your code. Make sure things do what they're supposed to. If you haven't run your code before reading this, you're taking risks you can't afford. Always be testing.

# (Skills: Object instantiation, dealing with "attr_things" appropriately, testing with RSpec and/or driver code, reading and debugging errors)

# Release 3 -  More behavior! Marissa thinks you're doing great work, and she's ready to get her hands dirty with some number crunching. Pick three of these methods, write them, test them, and then move on if you'd like.

# Write a method that returns an array containing just the venue names of each show in a given tour.

# Write a method that returns the average ticket price of all the shows in a tour. Whose responsibility is this work? (Would you ask a single show to do this? A single tour?)

# If there were lots of empty seats last year, TSP won't be playing there again this year. Write a method that displays the show with the lowest attendance percentage. (Again, which class should hold this method? Keep asking this.)

# Write a method that returns the total revenue from a given show.

# Write a method that returns the show with the highest total revenue.

# TSP is superstitious. Write a method called lucky? that returns true if the length of a show's venue name is evenly divisible into its max attendance count, false otherwise.

# Bonus points: Memo from Marissa: "On second thought, maybe it's not all about butts in the seats..." Write a method that returns the show with the highest CD sales, and make it also print out something like "TRUE BELIEVERS! DON'T ABANDON THIS CROWD" if that show is also the lowest-attended.

# (Skills: Iterating over enumerables while using the best method for the job at hand, implementing basic algorithms, conditional logic, testing, testing, holy crap please be testing things at this point!)

# Release 4 - It's SQL season! You've got something that works, and while you built it, you were practicing a lot of stuff from the first half of the phase. Now implement what you've just started learning this week!

# First, use Schema Designer or something like it (pen and paper is fine) to draw out the basic relationship between your classes in database table format. Make sure to add foreign keys where necessary.

# Now, piggyback off that and use CREATE TABLE a couple times to build your schema in an actual database. (Review this to get started, if you need to: https://github.com/chi-rock-doves-2015/database-drill-intro-to-sqlite-challenge) 

# Now use INSERT INTO to fill your tables. Bonus points if you only need to use it once per table! There is a way, and it involves commas, and it's very Googleable.

# Finally, practice using queries to give you information out of your db. Make sure to try a JOIN at least once. Like, maybe Marissa wants to see the tour name, the venue name, and the ticket price. How could you query for that?

# (Skills: Demonstrating comfort with the relationship between Ruby classes and database tables, designing schemas, creating db's, writing and querying data to/from them.)