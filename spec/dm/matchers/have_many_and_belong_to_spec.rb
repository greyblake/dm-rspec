require 'spec_helper'


describe DataMapper::Matchers::HaveManyAndBelongTo do
  context '#should' do
    it 'passes if association exists' do
      lambda { expect(Book).to have_many_and_belong_to :genres}.should_pass
    end

    it 'fails if association does not exist' do
      expect { expect(Book).to have_many_and_belong_to :authors}.
        to fail_with "expected to have many and belong to authors"
    end
  end

  context '#should_not' do
    it 'fails if association exists' do
      expect { expect(Genre).not_to have_many_and_belong_to :books}.
        to fail_with "expected to not have many and belong to books"
    end
  end

  context 'instance of model' do
    it "should pass" do
      lambda{ expect(Book.new).to have_many_and_belong_to :genres}.should_pass
    end
  end
end
