module DataMapper
  module Matchers
    def validate_presence_of(property)
      ValidatePresenceOf.new(property)
    end

    class ValidatePresenceOf < ValidationMatcher
      set_validation_subject "presence"

      def matches?(model)
        validators = model.validators.contexts[:default]
        presence_of = validators.find do |validator|
          validator.is_a? DataMapper::Validations::PresenceValidator and validator.field_name == @property
        end
        return false unless presence_of
        return false if @msg and @msg != presence_of.options[:message]
        true
      end

    end

  end
end
