require 'spec_helper'


describe DataMapper::Matchers::HaveProperty do
  context '#should' do
    it 'passes if property exists' do
      lambda {expect(Book).to have_property :name}.should_pass
    end

    it 'fails if property does not exist' do
      expect {expect(Book).to have_property :bad_property}.to fail_with "expected to have property bad_property"
    end
  end

  context '#should_not' do
    it 'fails if property exists' do
      expect {expect(Book).not_to have_property :name}.to fail_with "expected to not have property name"
    end
  end

  context 'instance of model' do
    it "should pass" do
      lambda{ expect(Book.new).to have_property :name}.should_pass
    end
  end
end
