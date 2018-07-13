require 'docking_station.rb'

describe DockingStation do

	# method tests
	it { is_expected.to respond_to :release_bike }
	it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to :bikes }

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

    it 'will allow 20 bikes to be docked' do
      20.times {subject.dock(Bike.new)}
      expect(subject.bikes.length).to eq 20
    end

    it 'raises error if capacity exceeds 20' do
      20.times {subject.dock(Bike.new)}
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

