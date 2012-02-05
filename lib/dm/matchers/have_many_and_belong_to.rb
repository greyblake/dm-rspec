module DataMapper
  module Matchers

    class HaveManyAndBelongTo
      def initialize(name)
        @name = name
      end

      def matches?(model)
        model_class = model.is_a?(Class) ? model : model.class
	relation = model_class.relationships[@name.to_s]
	relation && relation.is_a?(DataMapper::Associations::ManyToMany::Relationship)
      end

      def failure_message
        "expected to have many and belong to #{@name}"
      end

      def negative_failure_message
        "expected to not have many and belong to #{@name}"
      end
      
      def description
        "belongs to #{@parent}"
      end
    end


    def have_many_and_belong_to(name)
      HaveManyAndBelongTo.new(name)
    end

  end
end
