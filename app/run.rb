require './app/game_window'

guy_config = {:image => 'purple-fish', :speed => 3, :x => 400, :y => 100}
shark_config = {x: 200, y: 200, speed: 4}

window = GameWindow.new(guy_config, shark_config)
window.show