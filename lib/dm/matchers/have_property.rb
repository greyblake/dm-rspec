module DataMapper
  module Matchers

    class HaveProperty
      def initialize(property)
        @property = property.to_sym
      end

      def matches?(model)
        model_class = model.is_a?(Class) ? model : model.class
        model_class.properties.map(&:name).include? @property
      end

      def failure_message
        "expected to have property #{@property}"
      end

      def failure_message_when_negated
        "expected to not have property #{@property}"
      end
      
      def description
        "have property #{@property}"
      end
    end


    def have_property(name)
      HaveProperty.new(name)
    end

  end
end
