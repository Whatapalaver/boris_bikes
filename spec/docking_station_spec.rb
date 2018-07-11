require 'docking_station.rb'

describe DockingStation do

	# method tests
	it { is_expected.to respond_to :release_bike }
	it { is_expected.to respond_to :dock }
	it { is_expected.to respond_to :bike }

	# releases working bike
	it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  # docking tests

  it 'docks something' do
  	bike = Bike.new
  	expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
  	bike = Bike.new
  	subject.dock(bike)
  	expect(subject.bike).to eq bike
  end
end

