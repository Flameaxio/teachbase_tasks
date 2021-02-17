require_relative 'brand_module'
class Carriage
  attr_reader :type

  include(BrandModule)

  def initialize(type)
    @type = type
    valid?
  end

  def valid?
    raise 'Wrong type, type can be passenger or cargo', ArgumentError unless %i[passenger cargo].include?(@type)
  end

end
