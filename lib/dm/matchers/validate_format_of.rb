module DataMapper
  module Matchers
    def validate_format_of(property)
      ValidateFormatOf.new(property)
    end

    class ValidateFormatOf < ValidationMatcher
      set_validation_subject "format"

      def with(format)
        @format = format
        self
      end

      def matches?(model)
        model_class = model.is_a?(Class) ? model : model.class
        validators = model_class.validators.contexts[:default]
        format_of = validators.find do |validator|
          validator.is_a? DataMapper::Validations::FormatValidator and validator.field_name == @property
        end
        return false unless format_of
        return false unless format_of.options[:with] == @format
        return false if     @msg and @msg != format_of.options[:message]
        true
      end

      def failure_message
        msg = "expected to validate #{@validation_subject} of #{@property} with #{@format.inspect}"
        msg = %Q'#{msg} and message "#{@msg}"' if @msg
        msg
      end

      def negative_failure_message
        msg = "expected to not validate #{@validation_subject} of #{@property} with #{@format.inspect}"
        msg = %Q'#{msg} and message "#{@msg}"' if @msg
        msg
      end
    end

  end
end
