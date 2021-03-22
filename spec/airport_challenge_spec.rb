require 'airport_challenge'

describe Airport do
  let(:airport) { Airport.new(20) } 
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
          20.times { airport.land(plane) }
          expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport full'
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


  describe '#take_off' do
    context 'when not stormy' do
      before do
      allow(airport).to receive(:stormy?).and_return(false)
      end

      it 'instructs plane to takeoff' do 
        expect(airport).to respond_to(:take_off).with(1).argument
      end
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