# frozen_string_literal: true

# Counts total amount of the instances created
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # Class methods
  module ClassMethods
    attr_writer :instances
    def instances
      @instances ||= 0
    end
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
