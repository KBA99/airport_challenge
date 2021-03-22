require 'airport_challenge'

describe Airport do
  let(:airport) { Airport.new(Airport::DEFAULT_CAPACITY) } 
  let(:plane) { double :plane }

  describe '#land' do
    it 'lands a plane' do 
      # is_expected.to respond_to(:land).with(1).argument
      expect(airport).to respond_to(:land).with(1).argument
    end

    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return(false)
      end

      context 'when at capactiy' do
        it 'raises an error ' do
          Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
          expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
        end
      end

      context 'airport has a default capacity' do 
        it 'raises an error when planes landed exceed default capacity' do
          Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
          expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
        end
      end
    end

    context 'when stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return(true)
      end

      it 'raises an error' do
        expect { airport.land(plane) }.to raise_error 'Cannot land plane when stormy'
      end
    end
  end

  # Stub not working here
  describe '#take_off' do
    let(:plane1) { double :plane }
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return(false)
      end

      it 'instructs plane to takeoff' do 
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end

    it 'removes plane from airport after taking off' do
      airport.land(plane)
      airport.land(plane1)
      airport.take_off(plane1)
      expect(airport.planes_landed).not_to include(plane1)
    end

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
