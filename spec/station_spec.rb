require 'station'

describe Station do
  subject {Station.new('Shoreditch', 2)}

  it 'knows its name' do
    expect(subject.name).to eq('Shoreditch')
  end

  it 'knows its zone' do
    expect(subject.zone).to eq(2)
  end
end
