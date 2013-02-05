module DataMapper
  module Matchers
    def validate_length_of(property)
      ValidateLengthOf.new(property)
    end

    class ValidateLengthOf < ValidationMatcher
      set_validation_subject "length"
      
      def maximum(maximum)
        @maximum = maximum
        self
      end
      
      def max(maximum)
        maximum(maximum)
      end
      
      def length(maximum)
        maximum(maximum)
      end
      
      def minimum(minimum)
        @minimum = minimum
        self
      end
      
      def min(minimum)
        minimum(minimum)
      end
      
      def within(range)
        @within = range
        self
      end
      
      def in(range)
        within(range)
      end
      
      def is(is)
        @is = is
        self
      end
      
      def equals(equals)
        is(equals)
      end

      def matches?(model)
        model_class = model.is_a?(Class) ? model : model.class
        validators = model_class.validators.contexts[:default]
                
        validators = validators.select do |validator|
          validator.is_a? DataMapper::Validations::LengthValidator and validator.field_name == @property
        end
        validator = validators.last
        
        return false unless validator
        
        if @maximum
          return validator.options[:maximum] == @maximum
        elsif @minimum
          return validator.options[:minimum] == @minimum
        elsif @within
          return validator.options[:within] == @within
        elsif @is
          return validator.options[:is] == @is
        else
          return false
        end
      end
    end
  end
end
