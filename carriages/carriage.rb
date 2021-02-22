# frozen_string_literal: true

# Carriage class
class Carriage

  attr_reader :type
  attr_accessor :parent_train


  def initialize(type)
    @type = type
  end

  def add_train(train)
    raise ArgumentError unless train.is_a?(Train)

    self.parent_train = train
  end
end
