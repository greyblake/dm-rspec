module DataMapper
  module Matchers
    class ValidationMatcher

      class << self
	def set_validation_subject(subject)
	  @validation_subject = subject
	end

	def set_default_msg_reg(msg_reg)
	  @default_msg_reg = msg_reg
	end
      end



      def initialize(property)
        @property = property.to_sym
	@validation_subject = self.class.instance_eval { @validation_subject }
	@msg_reg = self.class.instance_eval { @default_msg_reg }
      end

      def with_message(msg)
        @msg = msg
        @msg_reg = /^#{Regexp.escape(@msg)}$/
        self
      end

      def failure_message
        msg = "expected to validate #{@validation_subject} of #{@property}"
        msg = %Q'#{msg} with message "#{@msg}"' if @msg
        msg
      end

      def failure_message_when_negated
        msg = "expected to not validate #{@validation_subject} of #{@property}"
        msg = %Q'#{msg} with message "#{@msg}"' if @msg
        msg
      end

      def description
        "validate #{@validation_subject} of #{@property}"
      end

    end
  end
end
