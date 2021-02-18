# frozen_string_literal: true

require_relative 'brand_module'

# Carriage class
class Carriage
  attr_reader :type

  include(BrandModule)

  def initialize(type)
    'Wrong type' unless %i[passenger cargo].include?(type)
    @type = type
  end
end
