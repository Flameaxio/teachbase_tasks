# frozen_string_literal: true

require_relative '../modules/brand_module'
require_relative '../modules/validation'
require_relative '../modules/accessors'

# Carriage class
class Carriage
  include(BrandModule)
  include(Validation)
  include(Accessors)

  validate(:type, :format, option: /(passenger) | (cargo)/)

  attr_reader :type

  strong_attr_accessor :parent_train, Train

  def initialize(type, brand)
    self.brand = brand
    @type = type
    valid?
  end

  def add_train(train)
    raise ArgumentError unless train.is_a?(Train)

    self.parent_train = train
  end
end
