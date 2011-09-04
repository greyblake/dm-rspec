require 'spec_helper'


describe DataMapper::Matchers::HaveManyAndBelongTo do
  context '#should' do
    it 'passes if association exists' do
      lambda { Book.should have_many_and_belong_to :genres}.should_pass
    end

    it 'fails if association does not exist' do
      lambda { Book.should have_many_and_belong_to :authors}.should
	fail_with "expected to have many and belong to authors"
    end
  end

  context '#should_not' do
    it 'fails if association exists' do
      lambda { Author.should_not have_many_and_belong_to :books}.should
	fail_with "expected to not have many and belong to books"
    end
  end
end
