require 'rubygems'
require 'gosu'
require 'chipmunk'

class Guy

  attr_accessor :alive, :x, :y, :won

  COLORS = ['purple', 'blue', 'red']

  def initialize(window, config)
    @window = window
    @x = config[:x]
    @y = config[:y]
    @color = 0
    @image = Gosu::Image.new(@window, "media/#{COLORS[@color]}-fish.png", false)
    @angle = 0
    @speed = config[:speed]
    @lives = 3
    @time = Time.now
    @won = false

    # @shape = shape
    # @shape.body.p = CP::Vec2.new(0.0, 0.0) # position
    # @shape.body.v = CP::Vec2.new(0.0, 0.0) # velocity
    # @shape.body.a = (3*Math::PI/2.0) # angle in radians; faces towards top of screen
  end

  def draw
    if @won
      party
      font = Gosu::Font.new(@window, 'Helvetica', 100)
      font.draw('You Win!', 400, 400, ZOrder::Text, 1, 1, Gosu::Color::GREEN)
    end

    if @lives > 0
      @image.draw_rot(@x, @y, ZOrder::Guy, @angle)
    else
      font = Gosu::Font.new(@window, 'Helvetica', 100)
      font.draw('Game Over', 400, 400, ZOrder::Text, 1, 1, Gosu::Color::RED)
    end
  end

  def move_right
    @angle = 90
    @x += Gosu::offset_x(90, @speed) if @x < 850
  end

  def move_left
    @angle = 270
    @x -= Gosu::offset_x(90, @speed) if @x > 50
  end

  def move_up
    @angle = 0
    @y += Gosu::offset_y(0, @speed) if @y > 75
  end

  def move_down
    @angle = 180
    @y -= Gosu::offset_y(0, @speed) if @y < 625
  end

  def die
    if !@won && Time.now - @time > 3
      @time = Time.now
      @lives -= 1 if @lives >= 0
      @color = 2 - (@lives-1)
      @image = Gosu::Image.new(@window, "media/#{COLORS[@color]}-fish.png", false) if @color
    end
  end

  def party
    #@color = Time.now.to_i % 3
    @color = (Time.now.to_f*10).floor % 3
    @image = Gosu::Image.new(@window, "media/#{COLORS[@color]}-fish.png", false) if @color
  end



end



