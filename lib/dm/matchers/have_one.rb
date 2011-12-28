module DataMapper
  module Matchers
    class HaveOne
      def initialize(child)
        @child = child
      end

      def matches?(parent)
        @parent = parent
        relation = @parent.relationships[@child.to_s]

        relation and
        relation.is_a?(DataMapper::Associations::OneToOne::Relationship) and
        relation.parent_model == parent
      end

      def failure_message
        "expected to have one #{@child}"
      end

      def negative_failure_message
        "expected not to have one #{@child}"
      end

      def description
        "has one #{@child}"
      end
    end

    def have_one(name)
      HaveOne.new(name)
    end
  end
end
