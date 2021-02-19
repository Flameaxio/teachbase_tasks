# frozen_string_literal: true

require_relative 'brand_module'
require_relative 'validation'

# Carriage class
class Carriage
  include(BrandModule)
  include(Validation)

  attr_reader :type

  validate(:type, :format, option: /(passenger) | (cargo)/)

  def initialize(type)
    @type = type
    valid?
  end

end
