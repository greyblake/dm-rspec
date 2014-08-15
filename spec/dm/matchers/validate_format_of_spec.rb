require 'spec_helper'

describe 'validate_format_of' do

  context 'without message' do
    context '#should 'do
      it 'passes if validatation exists' do
        lambda { expect(Tag).to validate_format_of(:name).with(/\w+/) }.should_pass
      end

      it 'fails if validation does not exist' do
        expect { expect(Tag).to validate_format_of(:id).with(/\w+/) }.
          to fail_with 'expected to validate format of id with /\w+/'
      end
    end

    context '#should_not' do
      it 'fails if validation exists' do
        expect { expect(Tag).not_to validate_format_of(:name).with(/\w+/) }.
          to fail_with 'expected to not validate format of name with /\w+/'
      end
    end
  end



  context 'with message' do
    context '#should' do
      it 'passes if messages are the same' do
        lambda{ expect(Genre).to validate_format_of(:name).with(/\w+/).
          with_message('Bad format of genre')
        }.should_pass
      end

      it 'fails if messages are different' do
        expect{ expect(Genre).to validate_format_of(:name).with(/\w+/).
          with_message('Different message')
        }.to fail_with 'expected to validate format of name with /\w+/ and message "Different message"'
      end
    end

    context '#should_not' do
      it 'fails if validation message exists and it is the same' do
        expect{ expect(Genre).not_to validate_format_of(:name).with(/\w+/).
          with_message('Bad format of genre')
        }.to fail_with 'expected to not validate format of name with /\w+/ and message "Bad format of genre"'
      end
    end
  end

  context 'instance of model' do
    it 'should pass' do
      lambda { expect(Tag.new).to validate_format_of(:name).with(/\w+/) }.should_pass
    end
  end
end
