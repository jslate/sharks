require './app/fish'

describe Fish do
  it "should be alive" do
    window = double('window')
    fish = Fish.new(window, {:image => 'purple-fish', :speed => 8, :x => 400, :y => 100})
    fish.alive.should == true
  end
end