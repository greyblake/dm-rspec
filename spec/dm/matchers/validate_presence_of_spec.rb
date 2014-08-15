require 'spec_helper'


describe 'validate_presence_of' do
  context "without message" do
    context '#should' do
      it 'passes if validation exists' do
        lambda{ expect(Person).to validate_presence_of :last_name}.should_pass
      end

      it 'fails if validation does not exist' do
        expect{ expect(Person).to validate_presence_of :age}.
          to fail_with "expected to validate presence of age"
      end
    end

    context '#should_not' do
      it 'fails if validation exists' do
        expect{ expect(Person).not_to validate_presence_of :last_name}.
          to fail_with "expected to not validate presence of last_name"
      end
    end
  end


  context 'with message' do
    context '#should' do
      it 'passes if messages are the same' do
        lambda{ expect(Person).to validate_presence_of(:first_name).
          with_message('Where is the first name?')
        }.should_pass
      end

      it 'fails if messages are different' do
        expect{ expect(Person).to validate_presence_of(:first_name).
          with_message('Different message')
        }.to fail_with 'expected to validate presence of first_name with message "Different message"'
      end
    end

    context '#should_not' do
      it 'fails if validation message exists' do
        expect{ expect(Person).not_to validate_presence_of(:first_name).
          with_message('Where is the first name?')
        }.to fail_with 'expected to not validate presence of first_name with message "Where is the first name?"'
      end
    end
  end

  context 'instance of model' do
    it "should pass" do
      lambda{ expect(Person.new).to validate_presence_of :last_name}.should_pass
    end
  end
end
