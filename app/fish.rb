require 'rubygems'
require 'gosu'
require 'chipmunk'

class Fish

  attr_accessor :alive, :x, :y, :won, :angle, :image

  COLORS = ['purple', 'blue', 'red']

  def initialize(config, &block)
    @x = config[:x]
    @y = config[:y]
    @color = 0
    @angle = 0
    @speed = config[:speed]
    @lives = 3
    @time = Time.now
    @won = false
    @change_image_listener = block
    @change_image_listener.call(image)

    # @shape = shape
    # @shape.body.p = CP::Vec2.new(0.0, 0.0) # position
    # @shape.body.v = CP::Vec2.new(0.0, 0.0) # velocity
    # @shape.body.a = (3*Math::PI/2.0) # angle in radians; faces towards top of screen
  end

  # def update
  #   if @won
  #     party
  #     # font = Gosu::Font.new(@window, 'Helvetica', 100)
  #     # font.draw('You Win!', 400, 400, ZOrder::Text, 1, 1, Gosu::Color::GREEN)
  #   end

  #   if @lives > 0
  #     #@image.draw_rot(@x, @y, ZOrder::Fish, @angle)
  #   else
  #     # font = Gosu::Font.new(@window, 'Helvetica', 100)
  #     # font.draw('Game Over', 400, 400, ZOrder::Text, 1, 1, Gosu::Color::RED)
  #   end
  # end

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
      @change_image_listener.call(image) if @color
    end
  end

  def image
    "media/#{COLORS[@color]}-fish.png"
  end

  def party
    @color = (Time.now.to_f*10).floor % 3
    @change_image_listener.call(image) if @color
  end



end



