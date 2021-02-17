class Carriage
  attr_reader :type

  def initialize(type)
    'Wrong type' unless %i[passenger cargo].include?(type)
    @type = type
  end
end
