module DataMapper
  module Matchers
    def validate_uniqueness_of(property)
      ValidateUniquenessOf.new(property)
    end

    class ValidateUniquenessOf < ValidationMatcher
      set_validation_subject "uniqueness"

      def matches?(model)
        model_class = model.is_a?(Class) ? model : model.class

        validators = model_class.validators.contexts[:default]
        uniqueness_of = validators.find do |validator|
          validator.is_a? DataMapper::Validations::UniquenessValidator and validator.field_name == @property
        end
        return false unless uniqueness_of
        return false if @msg and @msg != uniqueness_of.options[:message]
        true
      end
    end

  end
end
