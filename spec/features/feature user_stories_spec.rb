describe "airport user story" do

  describe '#land' do
    let(:airport) {Airport.new(20)}
    let(:plane) {Plane.new}
  # As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

#Stub not working here
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return(false)
      end

      it 'so planes land at airports, instructs a plane to land' do
        expect { airport.land(plane) }.not_to raise_error
      end

            # As an air traffic controller 
      # To ensure safety 
      # I want to prevent landing when the airport is full 
      it 'prevents planes from landing when airport is full' do
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
      end
    end

          # #       As an air traffic controller 
      # # To ensure safety 
      # # I want to prevent landing when weather is stormy 
      # it 'prevents planes from landing when stormy' do
    context 'when stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return(true)
      end

      it 'prevents a plane from taking off' do
        expect { airport.land(plane) }.to raise_error 'Cannot land plane when stormy'
      end
    end
  end


  describe '#take_off' do
    let(:airport) {Airport.new(20)}
    let(:plane) {Plane.new}

    #   As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport
    context 'when not stormy' do
      before do
      allow(airport).to receive(:stormy?).and_return(false)
      end

      it 'instructs plane to take off' do
        expect {airport.take_off(plane)}.not_to raise_error
      end
    end

#     As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

    context 'when stormy' do
      before do
      allow(airport).to receive(:stormy?).and_return(true)
      end 

      it 'prevents plane from taking off when weather is stormy' do
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane when stormy'
      end
    end
  end

end