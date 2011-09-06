require 'spec_helper'


describe DataMapper::Matchers::HaveManyThrough do
  context '#should' do
    it 'passes if association exists' do
      lambda { Book.should have_many(:tags).trough(:taggins) }.should_pass
    end

    it 'fails if association does not exist' do
      lambda { Author.should have_many(:books).trough(:something) }.should fail_with 
      lambda { Book.should have_many(:tags).trough(:author) }.should fail_with
    end
  end

  context '#should_not' do
    it 'fails if association exists' do
      lambda { Book.should_not have_many(:tags).trough(:taggins) }.should fail_with
    end
  end
end
