require 'spec_helper'


describe DataMapper::Matchers::HaveMany do
  context '#should' do
    it 'passes if association exists' do
      lambda { expect(Author).to have_many :books}.should_pass
    end

    it 'fails if association does not exist' do
      expect { expect(Author).to have_many :bad_relations}.to fail_with "expected to have many bad_relations"
    end
  end

  context '#should_not' do
    it 'fails if association exists' do
      expect { expect(Author).not_to have_many :books}.to fail_with "expected to not have many books"
    end
  end

  context 'instance of model' do
    it "should pass" do
      lambda { expect(Author.new).to have_many :books }.should_pass
    end
  end
end
