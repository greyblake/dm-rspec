require 'spec_helper'

describe DataMapper::Matchers::HaveOne do
  context '#should' do
    it 'passes if association exists' do
      lambda { Book.should have_one :foreword}.should_pass
    end

    it 'fails if association does not exist' do
      lambda { Author.should have_one :book}.should fail_with "expected to have one book"
    end
  end

  context '#should_not' do
    it 'fails if association exists' do
      lambda { Book.should_not have_one :foreword}.should fail_with "expected not to have one foreword"
    end
  end

  context 'instance of model' do
    it 'should pass' do
      lambda { Book.new.should have_one :foreword}.should_pass
    end
  end
end
