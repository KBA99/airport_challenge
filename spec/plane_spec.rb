require 'plane'

describe Plane do
  describe 'in journey' do 
    let(:plane) {Plane.new}

    it 'instructs plane to take off and have status in journey' do
      expect(plane).to respond_to(:take_off).with(1).argument
    end
  end


end