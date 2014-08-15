module DataMapper
  module Matchers

    class HaveManyThrough
      def initialize(children, broker)
        @children, @broker = children, broker
      end

      def matches?(parent)
        parent_class = parent.is_a?(Class) ?  parent : parent.class
        relation = parent_class.relationships[@children.to_s]

        relation.parent_model == parent_class and
        relation.name == @children.to_sym and
        relation.options[:through] == @broker.to_sym
      end

      def failure_message
        "expected to have many #{@children} through #{@broker}"
      end

      def failure_message_when_negated
        "expected to not have many #{@children} through #{@broker}"
      end
      
      def description
        "has many #{@children} through #{@broker}"
      end
    end

  end
end
