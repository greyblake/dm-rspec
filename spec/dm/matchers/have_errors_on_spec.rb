require 'spec_helper'


describe DataMapper::Matchers::HaveErrorsOn do
  before(:all) do
    @invalid = Book.new
    @valid = Book.new(:name => 'War and Peace')
  end


  context '#should' do
    it 'passes for invalid model' do
      lambda {@invalid.should have_errors_on :name}.should_pass
      lambda {@invalid.should have_error_on :name}.should_pass
    end

    it 'fails for valid model' do
      lambda {@valid.should have_errors_on :name}.should fail_with "expected to have errors on name"
      lambda {@valid.should have_error_on :name}.should fail_with "expected to have errors on name"
    end
  end

  context '#should_not' do
    it 'fails for invalid model' do
      lambda {@invalid.should_not have_errors_on :name}.should fail_with "expected to not have errors on name"
      lambda {@invalid.should_not have_error_on :name}.should fail_with "expected to not have errors on name"
    end
  end
end
