require 'spec_helper'

describe 'validate_uniqueness_of' do

  context 'without message' do
    context '#should 'do
      it 'passes if validatation exists' do
        lambda { expect(Author).to validate_uniqueness_of :last_name}.should_pass
      end

      it 'fails if validation does not exist' do
        expect { expect(Author).to validate_uniqueness_of :first_name}.
          to fail_with "expected to validate uniqueness of first_name"
      end
    end

    context '#should_not' do
      it 'fails if validation exists' do
        expect { expect(Author).not_to validate_uniqueness_of :last_name}.
          to fail_with "expected to not validate uniqueness of last_name"
      end
    end
  end



  context 'with message' do
    context '#should' do
      it 'passes if messages are the same' do
        lambda{ expect(Genre).to validate_uniqueness_of(:name).
          with_message('Genre name must be unique!')
        }.should_pass
      end

      it 'fails if messages are different' do
        expect{ expect(Genre).to validate_uniqueness_of(:name).
          with_message('Different message')
        }.to fail_with 'expected to validate uniqueness of name with message "Different message"'
      end
    end

    context '#should_not' do
      it 'fails if validation message exists and it is the same' do
        expect{ expect(Genre).not_to validate_uniqueness_of(:name).
          with_message('Genre name must be unique!')
        }.to fail_with 'expected to not validate uniqueness of name with message "Genre name must be unique!"'
      end
    end
  end


  context 'instance of model' do
    it "should pass" do
      lambda { expect(Author.new).to validate_uniqueness_of :last_name}.should_pass
    end
  end
end
