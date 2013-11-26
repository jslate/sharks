require './app/game_window'

fish_config = {:image => 'purple-fish', :speed => 4, :x => 400, :y => 100}
shark_config = {x: 200, y: 200, speed: 5}

window = GameWindow.new(fish_config, shark_config)
window.show