module DataMapper
  module Matchers
    def validate_uniqueness_of(property)
      ValidateUniquenessOf.new(property)
    end

    class ValidateUniquenessOf < ValidationMatcher
      set_validation_subject "uniqueness"
      set_default_msg_reg    /is already taken$/

      def matches?(model)
        model_class = model.is_a?(Class) ? model : model.class
        val = rand.to_s

        model_class.create!(@property => val)
        record = model_class.new(@property => val)
        record.valid?
        errors = record.errors.send(:errors)
        errors = errors[@property.to_sym]
        errors and errors.find {|msg| msg =~ @msg_reg}
      end
    end

  end
end
