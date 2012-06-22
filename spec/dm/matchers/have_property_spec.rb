require 'spec_helper'


describe "DataMapper::Matchers::HaveProperty" do
  context '#should' do
    it 'passes if property exists' do
      lambda {Book.should have_property :name}.should_pass
    end
    
    it 'passes if property exists and is of correct type' do
      lambda { Book.should have_property(:name).of_type(DataMapper::Property::String)}.should_pass
    end

    it 'fails if property does not exist' do
      lambda {Book.should have_property :bad_property}.should fail_with "Expected Book to have property bad_property"
    end
    
    it 'fails if property exists and is of wrong type' do
      lambda {Book.should have_property(:name).of_type(Integer)}.should fail_with "property name should be of type Integer but is of type DataMapper::Property::String"
    end      
  end

  context '#should_not' do
    it 'fails if property exists' do
      lambda {Book.should_not have_property :name}.should fail_with "Expected Book to not have property name"
    end
  end

  context 'instance of model' do
    it "should pass" do
      lambda{ Book.new.should have_property :name}.should_pass
    end
  end
end
