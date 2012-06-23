RSpec::Matchers.define :validate_inclusion_of do |property|
  
  chain :within do |array|
    @array = array
  end
  
  match do |model|
    @model_class = model.is_a?(Class) ? model : model.class
    validators = @model_class.validators.contexts[:default]
    @validator = validators.find do |validator|
      validator.is_a? DataMapper::Validations::WithinValidator and validator.field_name == property
    end
    if @validator and @array
      @array_ok = Set.new(@validator.options[:set]) == Set.new(@array)
    else
      @validator
    end
  end
  
  failure_message_for_should do |model|
    msg = "expected to validate that #{property} is in #{@array.join(",")}"
    if @validator and !@array_ok
      msg += " but it validates that #{property} is in #{@validator.options[:set].join(",")}"
    end
    msg
  end

  failure_message_for_should_not do |model|
    "expected to not validate that #{property} is in #{@array.join(",")}"
  end
  

end

