module DataMapper
  module Matchers
    def validate_uniqueness_of(property)
      ValidateUniquenessOf.new(property)
    end

    class ValidateUniquenessOf < ValidationMatcher
      set_validation_subject "uniqueness"
      set_default_msg_reg    /is already taken$/

      def matches?(klass)
        val = rand.to_s
        klass.create!(@property => val)
        model = klass.new(@property => val)
        model.valid?
        errors = model.errors.send(:errors)
        errors = errors[@property.to_sym]
        errors and errors.find {|msg| msg =~ @msg_reg}
      end
    end

  end
end
