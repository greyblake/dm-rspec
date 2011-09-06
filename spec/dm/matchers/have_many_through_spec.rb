require 'spec_helper'


describe DataMapper::Matchers::HaveManyThrough do
  context '#should' do
    it 'passes if association exists' do
      lambda { Book.should have_many(:tags).through(:taggings) }.should_pass
    end

    it 'fails if association does not exist' do
      lambda { Author.should have_many(:books).through(:something) }.should fail_with "expected to have many books through something"
      lambda { Book.should have_many(:tags).through(:author) }.should fail_with "expected to have many tags through author"
    end
  end

  context '#should_not' do
    it 'fails if association exists' do
      lambda { Book.should_not have_many(:tags).through(:taggings) }.should fail_with "expected to not have many tags through taggings"
    end
  end
end
