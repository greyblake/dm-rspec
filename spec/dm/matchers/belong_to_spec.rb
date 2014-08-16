require 'spec_helper'


describe DataMapper::Matchers::BelongTo do
  context '#should' do
    it 'passes if association exists' do
      lambda { expect(Book).to belong_to :author }.should_pass
    end

    it 'fails if association does not exist' do
      expect { expect(Book).to belong_to :bad_relation}.to fail_with "expected to belong to bad_relation"
    end
  end

  context '#should_not' do
    it 'fails if association exists' do
      expect { expect(Book).not_to belong_to :author }.to fail_with "expected to not belong to author"
    end
  end

  context 'instance of model' do
    it "should pass" do
      lambda{ expect(Book.new).to belong_to :author}.should_pass
    end
  end

end
