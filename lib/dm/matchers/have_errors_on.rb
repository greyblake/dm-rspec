module DataMapper
  module Matchers

    class HaveErrorsOn
      def initialize(property)
	@property = property.to_sym
      end

      def matches?(model)
	@model = model
	@model.valid?
	!@model.errors[@property].empty?
      end

      def failure_message
	"expected to have errors on #{@property}"
      end

      def negative_failure_message
	"expected to not have errors on #{@property}"
      end

      def description
        "has errors on #{@property}"
      end
    end

    def have_errors_on(property)
      HaveErrorsOn.new(property)
    end

    alias :have_error_on :have_errors_on 
  end
end
