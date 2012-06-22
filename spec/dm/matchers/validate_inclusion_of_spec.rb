require 'spec_helper'

describe 'validate_inclusion_of' do

  context '#should 'do
    it 'passes if validatation exists' do
      lambda { Person.should validate_inclusion_of(:gender).within(["male","female"]) }.should_pass
    end
    
    it 'passes even when the order is wrong' do
      lambda { Person.should validate_inclusion_of(:gender).within(["female","male"]) }.should_pass
    end

    it 'fails if validation does not exist' do
      a = ["male","female"]
      lambda { Person.should validate_inclusion_of(:foo).within(a) }.
        should fail_with "expected to validate that foo is in #{a.join(",")}"
    end

    it 'fails if validation exists but arrays are different' do
      a = ["m","f"]
      lambda { Person.should validate_inclusion_of(:gender).within(a) }.
        should fail_with "expected to validate that gender is in #{a.join(",")} but it validates that gender is in male,female"
    end
  end

  context '#should_not' do
    it 'fails if validation exists' do
      a = ['male','female']
      lambda { Person.should_not validate_inclusion_of(:gender).within(a) }.
        should fail_with "expected to not validate that gender is in #{a.join(",")}"
    end
  end

  context 'instance of model' do
    it 'should pass' do
      lambda { Person.new.should validate_inclusion_of(:gender).within(['male','female']) }.should_pass
    end
  end
end
