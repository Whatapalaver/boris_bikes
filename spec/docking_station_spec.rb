require 'docking_station.rb'

describe DockingStation do

	# method tests
	it { is_expected.to respond_to :release_bike }
	it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bike }
  
  it 'releases working bikes' do
    subject.dock(Bike.new)
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

  # Error raising

  it 'should raise an error if no bikes available' do
    expect {subject.release_bike}.to raise_error("There are no bikes available here")
  end

  it 'should release a bike if one is available' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raises error if attempt to dock a bike when station already contains bike' do
    bike1 = Bike.new
    bike2 = Bike.new
    subject.dock(bike1)
    expect {subject.dock(bike2)}.to raise_error("The dock is full")
  end
end

