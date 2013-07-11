require 'rubygems'
require 'gosu'
require 'chipmunk'

class Guy

  attr_accessor :alive, :x, :y

  COLORS = ['purple', 'blue', 'red']

  def initialize(window, config)
    @window = window
    @x = config[:x]
    @y = config[:y]
    @color = COLORS[0]
    @image = Gosu::Image.new(@window, "media/#{@color}-fish.png", false)
    @angle = 0
    @speed = config[:speed]
    @lives = 3
    @time = Time.now

    # @shape = shape
    # @shape.body.p = CP::Vec2.new(0.0, 0.0) # position
    # @shape.body.v = CP::Vec2.new(0.0, 0.0) # velocity
    # @shape.body.a = (3*Math::PI/2.0) # angle in radians; faces towards top of screen
  end

  def draw
    if @lives > 0
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
    if Time.now - @time > 3
      @time = Time.now
      @lives -= 1 if @lives >= 0
      @color = COLORS[2 - (@lives-1)]
      @image = Gosu::Image.new(@window, "media/#{@color}-fish.png", false) if @color
    end
  end





end



