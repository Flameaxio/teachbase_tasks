# frozen_string_literal: true

# Defines attribute setters and getters with history tracking array
module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  # Contains all class methods
  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        define_method(name) do
          instance_variable_get("@#{name}")
        end

        define_method("#{name}=") do |value|
          instance_variable_set("@#{name}", value)
          send("#{name}_history") << value
        end

        define_history_var(name)
      end
    end

    def strong_attr_accessor(name, klass)
      var_name = "@#{name}"

      define_method(name) do
        instance_variable_get(name)
      end

      define_method("#{name}=") do |value|
        raise TypeError, "value should be #{klass}" unless value.is_a?(klass)

        instance_variable_set(var_name, value)
      end
    end

    private

    def define_history_var(name)
      history_var_name = "@#{name}_history"

      define_method("#{name}_history") do
        instance_variable_get(history_var_name) ||
          instance_variable_set(history_var_name, [])
      end
    end
  end
end
