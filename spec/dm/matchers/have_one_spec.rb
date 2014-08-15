require 'spec_helper'

describe DataMapper::Matchers::HaveOne do
  context '#should' do
    it 'passes if association exists' do
      lambda { expect(Book).to have_one :foreword}.should_pass
    end

    it 'fails if association does not exist' do
      expect { expect(Author).to have_one :book}.to fail_with "expected to have one book"
    end
  end

  context '#should_not' do
    it 'fails if association exists' do
      expect { expect(Book).not_to have_one :foreword}.to fail_with "expected not to have one foreword"
    end
  end

  context 'instance of model' do
    it 'should pass' do
      lambda { expect(Book.new).to have_one :foreword}.should_pass
    end
  end
end
