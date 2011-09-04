require 'spec_helper'


describe DataMapper::Matchers::HaveProperty do
  context '#should' do
    it 'passes if property exists' do
      lambda {Book.should have_property :name}.should_pass
    end

    it 'fails if property does not exist' do
      lambda {Book.should have_property :bad_property}.should fail_with "expected to have property bad_property"
    end
  end

  context '#should_not' do
    it 'fails if property exists' do
      lambda {Book.should_not have_property :name}.should fail_with "expected to not have property name"
    end
  end
end
