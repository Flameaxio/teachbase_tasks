# frozen_string_literal: true

require_relative '../modules/brand_module'
require_relative '../modules/validation'

# Carriage class
class Carriage
  include(BrandModule)
  include(Validation)

  attr_reader :type
  attr_accessor :parent_train

  validate(:type, :format, option: /(passenger) | (cargo)/)

  def initialize(type)
    @type = type
    valid?
  end

  def add_train(train)
    raise ArgumentError unless train.is_a?(Train)

    self.parent_train = train
  end

end
