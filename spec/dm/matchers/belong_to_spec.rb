require 'spec_helper'


describe DataMapper::Matchers::BelongTo do
  context '#should' do
    it 'passes if association exists' do
      lambda { Book.should belong_to :author }.should_pass
    end

    it 'fails if association does not exist' do
      lambda { Book.should belong_to :bad_relation}.should fail_with "expected to belong to bad_relation"
    end
  end

  context '#should_not' do
    it 'fails if association exists' do
      lambda { Book.should_not belong_to :author }.should fail_with "expected to not belong to author"
    end
  end

  context 'instance of model' do
    it "should pass" do
      lambda{ Book.new.should belong_to :author}.should_pass
    end
  end

end
