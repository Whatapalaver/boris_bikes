require 'docking_station.rb'

describe DockingStation do

	# method tests
	it { is_expected.to respond_to :release_bike }
	it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bikes }

  it 'shows default capacity if no argument given' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'shows updated capacity if argument given' do
    expect(DockingStation.new(30).capacity).to eq 30
  end

  describe "#release_bike" do
    it 'should raise an error if no bikes available' do
      expect {subject.release_bike}.to raise_error("There are no bikes available here")
    end

    it 'should release a bike if one is available' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe "#dock" do

    it 'will allow bikes to be docked upto Default Capacity' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect(subject.bikes.length).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'raises error if capacity exceeds Default Capacity' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new).to raise_error("The dock is full")}
    end

  end

  describe "#working?" do

    it 'releases working bikes' do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike).to be_working
    end 

  end
end

