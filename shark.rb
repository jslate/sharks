require 'rubygems'
require 'gosu'
require './angle_range'

class Shark

  attr_accessor :x, :y

  def initialize(window, config)
    @window = window
    @x = config[:x]
    @y = config[:y]
    @image = Gosu::Image.new(@window, "media/shark.png", false)
    @angle = 90
    @speed = config[:speed]
    puts 'shark initialize'
  end

  def move
    deal_with_edge
    @angle = rand(180) if rand(250) == 1
    @angle = AngleRange::normalize(@angle)
    @x += Gosu::offset_x(@angle, @speed)
    @y += Gosu::offset_y(@angle, @speed)
  end

  def draw
    x_factor = 1
    x_factor = -1 if @angle > 180
    @image.draw_rot(@x, @y, ZOrder::Shark, @angle, 0.5, 0.5, x_factor)
  end

  def deal_with_edge
    if @x > @window.width && AngleRange.new(0, 180).include?(@angle)
      @angle = 270 - (@angle - 90)
    end
    if @x < 0  && AngleRange.new(180, 0).include?(@angle)
      @angle = 90 - (@angle - 270)
    end
    if @y < 0 && AngleRange.new(270, 90).include?(@angle)
      @angle = 180 - (@angle - 360)
    end
    if @y > @window.height && AngleRange.new(90, 270).include?(@angle)
      @angle = 360 - (@angle - 180)
    end
  end

end