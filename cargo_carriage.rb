# frozen_string_literal: true

require_relative 'carriage'

# Cargo carriage class
class CargoCarriage < Carriage
  attr_reader :capacity

  def initialize(type, capacity)
    super(type)
    @capacity = capacity
  end

end