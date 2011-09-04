module DataMapper
  module Resource

    def errors_on(property)
      self.valid?
      errors.send(:errors)[property] or []
    end

    alias :error_on :errors_on
  end
end
