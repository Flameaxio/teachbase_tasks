# frozen_string_literal: true

require_relative 'brand_module'

# Carriage class
class Carriage
  attr_reader :type

  include(BrandModule)

  def initialize(type)
    @type = type
    valid?
  end

  def valid?
    raise ArgumentError, 'Wrong type, type can be passenger or cargo' unless %i[passenger cargo].include?(@type)

    true
  end
end
