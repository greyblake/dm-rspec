require 'spec_helper'


describe DataMapper::Matchers::HaveMany do
  context '#should' do
    it 'passes if association exists' do
      lambda { Author.should have_many :books}.should_pass
    end

    it 'fails if association does not exist' do
      lambda { Author.should have_many :bad_relations}.should fail_with "expected to have many bad_relations"
    end
  end

  context '#should_not' do
    it 'fails if association exists' do
      lambda { Author.should_not have_many :books}.should fail_with "expected to not have many books"
    end
  end
end
