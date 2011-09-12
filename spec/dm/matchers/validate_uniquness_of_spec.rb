require 'spec_helper'

describe 'validate_uniqueness_of' do

  context 'without message' do
    context '#should 'do
      it 'passes if validatation exists' do
        lambda { Author.should validate_uniqueness_of :last_name}.should_pass
      end

      it 'fails if validation does not exist' do
        lambda { Author.should validate_uniqueness_of :first_name}.
          should fail_with "expected to validate uniqueness of first_name"
      end
    end

    context '#should_not' do
      it 'fails if validation exists' do
        lambda { Author.should_not validate_uniqueness_of :last_name}.
          should fail_with "expected to not validate uniqueness of last_name"
      end
    end
  end



  context 'with message' do
    context '#should' do
      it 'passes if messages are the same' do
        lambda{ Genre.should validate_uniqueness_of(:name).
          with_message('Genre name must be unique!')
        }.should_pass
      end

      it 'fails if messages are different' do
        lambda{ Genre.should validate_uniqueness_of(:name).
          with_message('Different message')
        }.should fail_with 'expected to validate uniqueness of name with message "Different message"'
      end
    end

    context '#should_not' do
      it 'fails if validation message exists and it is the same' do
        lambda{ Genre.should_not validate_uniqueness_of(:name).
          with_message('Genre name must be unique!')
        }.should fail_with 'expected to not validate uniqueness of name with message "Genre name must be unique!"'
      end
    end
  end
end
