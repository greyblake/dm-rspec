module DataMapper
  module Matchers

    class HaveManyThrough
      def initialize(children, broker)
        @children, @broker = children, broker
      end

      def matches?(parent)
        relation = parent.relationships[@children.to_s]

        relation.parent_model == parent and
        relation.name == @children.to_sym and
        relation.options[:through] == @broker.to_sym
      end

      def failure_message
        "expected to have many #{@children} through #{@broker}"
      end

      def negative_failure_message
        "expected to not have many #{@children} through #{@broker}"
      end
      
      def description
        "has many #{@children} through #{@broker}"
      end
    end

  end
end
