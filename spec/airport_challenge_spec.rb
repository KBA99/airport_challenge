require 'airport_challenge'

describe Airport do
  let(:airport) { Airport.new(20) } 
  let(:plane) { double :plane }

  describe '#land' do
    it 'lands a plane' do 
      # is_expected.to respond_to(:land).with(1).argument
      expect(airport).to respond_to(:land).with(1).argument
    end
  
    context 'when at capactiy' do
      it 'raises an error ' do
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
      end
    end
  end

  describe '#take_off' do
    it 'instructs plane to takeoff' do 
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end

end