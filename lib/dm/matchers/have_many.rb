module DataMapper
  module Matchers

    class HaveMany
      def initialize(children)
        @children = children
      end

      def matches?(parent)
        @parent = parent
        relation = @parent.relationships[@children.to_s]

        relation and
        relation.is_a?(DataMapper::Associations::OneToMany::Relationship) and
        relation.parent_model == parent
      end

      # called only when the next syntax is used:
      #   Book.should have_many(:tags).trough(:tagging)
      def through(broker)
        HaveManyThrough.new(@children, broker)
      end

      def failure_message
        "expected to have many #{@children}"
      end

      def negative_failure_message
        "expected to not have many #{@children}"
      end
      
      def description
        "has many #{@children}"
      end
    end


    def have_many(name)
      HaveMany.new(name)
    end

  end
end
