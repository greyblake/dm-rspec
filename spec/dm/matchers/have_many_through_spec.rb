require 'spec_helper'


describe DataMapper::Matchers::HaveManyThrough do
  context '#should' do
    it 'passes if association exists' do
      lambda { expect(Book).to have_many(:tags).through(:taggings) }.should_pass
    end

    it 'fails if association does not exist' do
      expect { expect(Author).to have_many(:books).through(:something) }.to fail_with "expected to have many books through something"
      expect { expect(Book).to have_many(:tags).through(:author) }.to fail_with "expected to have many tags through author"
    end
  end

  context '#should_not' do
    it 'fails if association exists' do
      expect { expect(Book).not_to have_many(:tags).through(:taggings) }.to fail_with "expected to not have many tags through taggings"
    end
  end

  context 'instance of model' do
    it "should pass" do
      lambda{ expect(Book.new).to have_many(:tags).through(:taggings)}.should_pass
    end
  end
end
