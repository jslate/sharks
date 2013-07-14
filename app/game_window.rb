require 'chipmunk'
require './app/guy'
require './app/shark'

class GameWindow < Gosu::Window

  HEIGHT = 675
  WIDTH = 900
  LEVEL_TIME = 10

  def initialize(guy_config, shark_config)

    super(WIDTH, HEIGHT, false)
    self.caption = "Guys"
    @background_image = Gosu::Image.new(self, "media/ocean.png", true)
    @guy = Guy.new(self, guy_config)
    @shark = Shark.new(self, shark_config)
    @start_time = Time.now

  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @guy.draw
    @shark.draw unless @time_remaining <= 0

    font = Gosu::Font.new(self, 'Helvetica', 30)
    font.draw(@time_remaining, 800, 5, ZOrder::Text, 1, 1, Gosu::Color::RED)

  end

  def win
   @guy.won = true
  end

  def update

    @time_remaining ||= 100
    if @time_remaining > 0
      @elapsed_time = Time.now - @start_time
      @time_remaining = (LEVEL_TIME - @elapsed_time).floor
    else
      win
    end

    @guy.move_left if button_down?(123)
    @guy.move_right if button_down?(124)
    @guy.move_down if button_down?(125)
    @guy.move_up if button_down?(126)
    @shark.move(@guy.x, @guy.y)
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
  Text = 1
  Guy = 2
  Shark = 3
end
