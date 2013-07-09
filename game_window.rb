require 'chipmunk'
require './guy'
require './shark'

class GameWindow < Gosu::Window

  HEIGHT = 675
  WIDTH = 900

  def initialize(guy_config, shark_config)

    super(WIDTH, HEIGHT, false)
    self.caption = "Guys"
    @background_image = Gosu::Image.new(self, "media/ocean.png", true)
    @guy = Guy.new(self, guy_config)
    @shark = Shark.new(self, shark_config)

    @space = CP::Space.new
    @space.damping = 0.8

  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @guy.draw
    @shark.draw
  end

  def update
    @guy.move_left if button_down?(123)
    @guy.move_right if button_down?(124)
    @guy.move_down if button_down?(125)
    @guy.move_up if button_down?(126)
    @shark.move
    distance = Gosu::distance(@guy.x, @guy.y, @shark.x, @shark.y)
    @guy.die if distance < 100
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

module ZOrder
  Background = 0
  Shark = 2
  Guy = 1
end
