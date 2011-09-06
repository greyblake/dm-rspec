module DataMapper
  module Matchers

    class HaveManyThrough
      def initialize(children, broker)
        @children, @broker = children, broker
      end

      def matches?(parent)
        raise "Implement HaveManyThrough#matchers?"
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
