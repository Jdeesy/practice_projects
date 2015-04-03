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

class Show
  attr_reader :venue_name, :ticket_price, :venue_capacity, :actual_attendance, :cds_sold, :cd_price, :revenue, :filled_seat_percentage

  def initialize(options)
    @venue_name = options[:venue_name]
    @ticket_price = options[:ticket_price]
    @venue_capacity = options[:venue_capacity]
    @actual_attendance = options[:actual_attendance]
    @cds_sold = options[:cds_sold]
    @cd_price = options[:cd_price]
    @revenue = (ticket_price * actual_attendance) + (cds_sold * cd_price)
    @filled_seat_percentage = ((actual_attendance.to_f / venue_capacity) * 100).round(2)
  end

  def lucky?
    # Depends on how you want this calculated
    # This takes everything in the venue_name string (spaces, punctuation) to calculate if it is lucky
    # Or you could do a regex to remove everything but letter and then just cound the letters
    venue_capacity % venue_name.length == 0
  end

  def to_s
    "Show venue: #{venue_name}, Venue Capacity: #{venue_capacity}, Attendance: #{actual_attendance}, Ticket Price: $#{ticket_price}, CDs Sold: #{cds_sold}, CD Price: $#{cd_price}, Seats Filled: #{filled_seat_percentage}%, Revenue: $#{revenue}, Lucky: #{lucky?}."
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

  def tour_venue_names
    venue_names = []
    shows_list.each{ |show| venue_names << show.venue_name }
    venue_names
  end

  def average_ticket_cost
    ticket_prices = []
    shows_list.each{ |show| ticket_prices << show.ticket_price }
    tour_size = ticket_prices.size
    average_price = (ticket_prices.reduce(:+).to_f / tour_size).round(2)
  end

  def show_with_lowest_seats_filled
    puts "TRUE BELIEVERS! DON'T ABANDON THIS CROWD"
    puts shows_list.sort_by{ |show| show.filled_seat_percentage }[0]
  end

  def show_with_highest_revenue
    puts "The Show with the highest revenue is:"
    puts shows_list.sort_by{ |show| show.revenue }[-1]
  end

  def show_with_highest_cds_sold
    puts "The Show with the highest revenue is:"
    puts show_list.sort_by{ |show| show.cds_sold }[-1]
  end
end

####################
# DRIVER TEST CODE #
####################
# show = Show.new(show_1)
# puts show.filled_seat_percentage
# puts show.lucky?
# puts show

# new_tour = Tour.new
# p new_tour # should return like a hash, Tour class with object ID then revnue,expenses,profit, and show list
# new_tour.add_show(show_1)
# new_tour.calculate_total_revenue
# new_tour.calculate_profit
# p new_tour
# puts new_tour.shows_list
# new_tour.add_show(show_2)
# new_tour.add_show(show_3)
# p new_tour.tour_venue_names
# p new_tour.average_ticket_cost
# new_tour.show_with_lowest_seats_filled
# new_tour.show_with_highest_revenue 

# Release 4 - It's SQL season! You've got something that works, and while you built it, you were practicing a lot of stuff from the first half of the phase. Now implement what you've just started learning this week!

# First, use Schema Designer or something like it (pen and paper is fine) to draw out the basic relationship between your classes in database table format. Make sure to add foreign keys where necessary.

##################################################################################################
# Can't draw the schema on the train with no internet but it would be a one to many relationship.
# One tour has many shows.
# Table for both show and tour. Shows would have a column for tour_id.

# There could also be many bands at a single tour event (like warmup bands or people at music fests)
# You could have a table for bands and link them with the shows. Many to Many relationship here.
# One show can have many bands and bands can perform at many shows.

# Also you could have many bands that Marissa works for, or her company works for.
# You could have a table for agents and link them to the band. Probably a one to many.
# An agent can have many bands but a band only has one agent.(I think)
###################################################################################################

# Now, piggyback off that and use CREATE TABLE a couple times to build your schema in an actual database. (Review this to get started, if you need to: https://github.com/chi-rock-doves-2015/database-drill-intro-to-sqlite-challenge) 



# Now use INSERT INTO to fill your tables. Bonus points if you only need to use it once per table! There is a way, and it involves commas, and it's very Googleable.

# Finally, practice using queries to give you information out of your db. Make sure to try a JOIN at least once. Like, maybe Marissa wants to see the tour name, the venue name, and the ticket price. How could you query for that?

# (Skills: Demonstrating comfort with the relationship between Ruby classes and database tables, designing schemas, creating db's, writing and querying data to/from them.)