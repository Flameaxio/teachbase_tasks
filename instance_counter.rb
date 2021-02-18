# frozen_string_literal: true

# Counts all the instances of the class
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # Class methods
  module ClassMethods
    attr_accessor :instances
  end

  # Instance methods
  module InstanceMethods
    protected

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end
