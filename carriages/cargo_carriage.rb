# frozen_string_literal: true

require_relative 'carriage'

# Cargo carriage class
class CargoCarriage < Carriage
  include(Validation)
  attr_reader :capacity
  attr_accessor :load

  validate(:capacity, :format, option: /[+]?\d+([.]\d+)?/)

  def initialize(type, capacity, brand)
    raise ArgumentError if capacity.negative?

    @capacity = capacity
    super type, brand
    valid?
  end

  def load_cargo(amount)
    'Not enough capacity' if @load + amount > @capacity || amount.negative?
    @load += amount
  end

  def free_space
    @capacity - @load
  end

  def to_s
    "Total capacity: #{@capacity}, Load: #{@load}, Brand #{super.brand}"
  end
end
