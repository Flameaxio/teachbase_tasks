require_relative 'brand_module'
class Carriage
  attr_reader :type

  include(BrandModule)

  def initialize(type)
    'Wrong type' unless %i[passenger cargo].include?(type)
    @type = type
  end
end
