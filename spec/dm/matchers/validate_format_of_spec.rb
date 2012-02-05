require 'spec_helper'

describe 'validate_format_of' do

  context 'without message' do
    context '#should 'do
      it 'passes if validatation exists' do
        lambda { Tag.should validate_format_of(:name).with(/\w+/) }.should_pass
      end

      it 'fails if validation does not exist' do
        lambda { Tag.should validate_format_of(:id).with(/\w+/) }.
          should fail_with 'expected to validate format of id with /\w+/'
      end
    end

    context '#should_not' do
      it 'fails if validation exists' do
        lambda { Tag.should_not validate_format_of(:name).with(/\w+/) }.
          should fail_with 'expected to not validate format of name with /\w+/'
      end
    end
  end



  context 'with message' do
    context '#should' do
      it 'passes if messages are the same' do
        lambda{ Genre.should validate_format_of(:name).with(/\w+/).
          with_message('Bad format of genre')
        }.should_pass
      end

      it 'fails if messages are different' do
        lambda{ Genre.should validate_format_of(:name).with(/\w+/).
          with_message('Different message')
        }.should fail_with 'expected to validate format of name with /\w+/ and message "Different message"'
      end
    end

    context '#should_not' do
      it 'fails if validation message exists and it is the same' do
        lambda{ Genre.should_not validate_format_of(:name).with(/\w+/).
          with_message('Bad format of genre')
        }.should fail_with 'expected to not validate format of name with /\w+/ and message "Bad format of genre"'
      end
    end
  end

  context 'instance of model' do
    it 'should pass' do
      lambda { Tag.new.should validate_format_of(:name).with(/\w+/) }.should_pass
    end
  end
end
