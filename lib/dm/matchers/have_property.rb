module DataMapper
  module Matchers

    class HaveProperty
      def initialize(property)
        @property = property.to_sym
      end

      def matches?(model)
        model.properties.map(&:name).include? @property
      end

      def failure_message
        "expected to have property #{@property}"
      end

      def negative_failure_message
        "expected to not have property #{@property}"
      end
      
      def description
        "has property #{@children}"
      end
    end


    def have_property(name)
      HaveProperty.new(name)
    end

  end
end
