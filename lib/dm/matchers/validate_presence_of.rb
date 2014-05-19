module DataMapper
  module Matchers
    def validate_presence_of(property)
      ValidatePresenceOf.new(property)
    end

    class ValidatePresenceOf < ValidationMatcher
      set_validation_subject "presence"

      def matches?(model)
        model_class = model.is_a?(Class) ? model : model.class

        validators = model_class.validators.contexts[:default]
        presence_of = validators.find do |validator|
          validator.is_a? DataMapper::Validations::PresenceValidator and validator.field_name == @property
        end
        return false unless presence_of
        return false if @msg and @msg != presence_of.options[:message]
        true
      end

      def failure_message_for_presence
        "expected to validate presence of #{@property}#{with_msg}"
      end

      def negative_failure_message
        "expected to not validate presence of #{@property}#{with_msg}"
      end

      def with_msg
        " with message \"#{@msg}\"" if @msg
      end
    end
  end
end
