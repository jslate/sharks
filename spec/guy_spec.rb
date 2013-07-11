require './app/guy'

describe Guy do
  it "should be alive" do
    window = double('window')
    guy = Guy.new(window, {:image => 'purple-fish', :speed => 8, :x => 400, :y => 100})
    guy.alive.should == true
  end
end