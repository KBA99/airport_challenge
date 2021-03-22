describe "airport user story" do
    let(:airport) {Airport.new(20)}
    let(:plane) {Plane.new}

  describe '#land' do
  # As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
    it 'so planes land at airports, instructs a plane to land' do
      plane = Plane.new
      airport = Airport.new(20)
      expect { airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when the airport is full 
    it 'prevents planes from landing when airport is full' do
      airport = Airport.new(20)
      plane = Plane.new
      20.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
    end
  end


  describe '#take_off' do
  #   As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport
    context 'It instructs a plane to take off and checks if no longer in airport' do
      it 'instructs plane to take off' do
        expect {airport.take_off(plane)}.not_to raise_error
      end
    end
  end

end