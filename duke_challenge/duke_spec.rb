require_relative 'duke'

describe 'Show' do
  let(:show_1){ Show.new({venue_name: "Doug's Bar", ticket_price: 5, venue_capacity: 100, actual_attendance: 15, cds_sold: 1, cd_price: 5}) }

  it 'should return the venue_name' do
    expect(show_1.venue_name).to eq("Doug's Bar")
  end

  it 'should return ticket price' do
    expect(show_1.ticket_price).to eq(5)
  end

  it 'should return venue capacity' do 
    expect(show_1.venue_capacity).to eq(100) 
  end

  it 'should return actual attendance' do 
    expect(show_1.actual_attendance).to eq(15)
  end

  it 'should return cds sold' do 
    expect(show_1.cds_sold).to eq(1)
  end

  it 'should return cds price' do
    expect(show_1.cd_price).to eq(5)
  end

  it 'should return the percentage of filled seats' do
    expect(show_1.filled_seat_percentage.class).to eq(Float)
  end

  it 'should tell us if the show is lucky or not' do 
    expect(show_1.lucky?).to be true
  end
end



describe 'Tour' do
  let(:tour){ Tour.new }

  it 'should return total revenue' do 
    expect(tour.total_revenue).to eq(0)
  end

  it 'should return total expenses' do 
    expect(tour.total_expenses).to eq(0)
  end

  it 'should return total profit' do 
    expect(tour.total_profit).to eq(0)
  end

  it 'should return the number of shows' do 
    expect(tour.shows_list.size).to eq(0)
  end

  it 'should add a show to the show list' do 
    tour.add_show({venue_name: "Doug's Bar", ticket_price: 5, venue_capacity: 100, actual_attendance: 15, cds_sold: 1, cd_price: 5})
    expect(tour.shows_list.size).to eq(1)
  end

  it 'should return the total total revenue' do
    tour.add_show({venue_name: "Doug's Bar", ticket_price: 5, venue_capacity: 100, actual_attendance: 15, cds_sold: 1, cd_price: 5})
    expect(tour.calculate_total_revenue).to eq(80)
  end

  it 'should return the total profit' do 

  end
end