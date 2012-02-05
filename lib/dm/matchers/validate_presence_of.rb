module DataMapper
  module Matchers
    def validate_presence_of(property)
      ValidatePresenceOf.new(property)
    end

    class ValidatePresenceOf < ValidationMatcher
      set_validation_subject "presence"
      set_default_msg_reg    /must not be blank$/


      def matches?(model)
        model_class = model.is_a?(Class) ? model : model.class
        [nil, ''].each do |val|
          obj = model_class.new(@property => val)
          return false if obj.valid?
          if messages = obj.errors.send(:errors)[@property]
            return false unless messages.find{|msg| msg =~ @msg_reg}
          else
            return false
          end
        end
        true
      end
    end

  end
end
