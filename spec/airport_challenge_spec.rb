require 'airport_challenge'

describe Airport do

  it 'lands a plane' do 
    # is_expected.to respond_to(:land).with(1).argument
    expect(subject).to respond_to(:land).with(1).argument
    end
end