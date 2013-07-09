require 'rubygems'
require 'gosu'
require 'chipmunk'

class Guy

  attr_accessor :alive, :x, :y

  def initialize(window, config)
    @window = window
    @x = config[:x]
    @y = config[:y]
    @image = Gosu::Image.new(@window, "media/#{config[:image]}.png", false)
    @angle = 0
    @speed = config[:speed]
    @alive = true

    # @shape = shape
    # @shape.body.p = CP::Vec2.new(0.0, 0.0) # position
    # @shape.body.v = CP::Vec2.new(0.0, 0.0) # velocity
    # @shape.body.a = (3*Math::PI/2.0) # angle in radians; faces towards top of screen
  end

  def draw
    if @alive
      @image.draw_rot(@x, @y, ZOrder::Guy, @angle)
    else
      font = Gosu::Font.new(@window, 'Helvetica', 100)
      font.draw('Game Over', 400, 400, ZOrder::Guy, 1, 1, Gosu::Color::RED)
    end
  end

  def move_right
    @angle = 90
    @x += Gosu::offset_x(90, @speed) if @x < 750
  end

  def move_left
    @angle = 270
    @x -= Gosu::offset_x(90, @speed) if @x > 50
  end

  def move_up
    @angle = 0
    @y += Gosu::offset_y(0, @speed) if @y > 50
  end

  def move_down
    @angle = 180
    @y -= Gosu::offset_y(0, @speed) if @y < 550
  end

  def die
    @alive = false
  end



end



