require 'spec_helper'


describe 'validate_presence_of' do
  context "without message" do
    context '#should' do
      it 'passes if validation exists' do
        lambda{ Person.should validate_presence_of :last_name}.should_pass
      end

      it 'fails if validation does not exist' do
        lambda{ Person.should validate_presence_of :age}.
          should fail_with "expected to validate presence of age"
      end
    end

    context '#should_not' do
      it 'fails if validation exists' do
        lambda{ Person.should_not validate_presence_of :last_name}.
          should fail_with "expected to not validate presence of last_name"
      end
    end
  end


  context 'with message' do
    context '#should' do
      it 'passes if messages are the same' do
        lambda{ Person.should validate_presence_of(:first_name).
          with_message('Where is the first name?')
        }.should_pass
      end

      it 'fails if messages are different' do
        lambda{ Person.should validate_presence_of(:first_name).
          with_message('Different message')
        }.should fail_with 'expected to validate presence of first_name with message "Different message"'
      end
    end

    context '#should_not' do
      it 'fails if validation message exists' do
        lambda{ Person.should_not validate_presence_of(:first_name).
          with_message('Where is the first name?')
        }.should fail_with 'expected to not validate presence of first_name with message "Where is the first name?"'
      end
    end
  end

  context 'instance of model' do
    it "should pass" do
      lambda{ Person.new.should validate_presence_of :last_name}.should_pass
    end
  end
end
