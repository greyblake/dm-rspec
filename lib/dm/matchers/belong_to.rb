module DataMapper
  module Matchers

    class BelongTo
      def initialize(parent)
        @parent = parent
      end

      def matches?(child)
        child_class = child.is_a?(Class) ? child : child.class
        relation = child_class.relationships[@parent.to_s]

        relation and
        relation.is_a?(DataMapper::Associations::ManyToOne::Relationship) and
        relation.child_model == child_class
      end

      def failure_message
        "expected to belong to #{@parent}"
      end

      def negative_failure_message
        "expected to not belong to #{@parent}"
      end

      def description
        "belongs to #{@parent}"
      end
    end


    def belong_to(name)
      BelongTo.new(name)
    end

  end
end
