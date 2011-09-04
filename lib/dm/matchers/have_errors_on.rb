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
      puts "dm-rspec: `have_errors_on` is deprecated. Please use `have(n).errors_on` instead"
      HaveErrorsOn.new(property)
    end

    def have_error_on(property)
      puts "dm-rspec: `have_error_on` is deprecated. Please use `have(1).error_on` instead"
      HaveErrorsOn.new(property)
    end
  end
end
