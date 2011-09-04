require 'spec_helper'


describe 'have errors_on' do
  before(:all) do
    @valid = Book.new(:name => 'War and Peace')
    @one_err = Book.new(:name => 'too short')
    @two_errs = Book.new
  end


  context '#should' do
    it 'passes' do
      lambda {@one_err.should have(1).error_on :name}.should_pass
      lambda {@two_errs.should have(2).errors_on :name}.should_pass
      lambda {@valid.should have(0).errors_on :name}.should_pass
    end

    it 'fails for valid mode' do
      lambda {@valid.should have(1).errors_on :name}.should fail
    end
  end

  context '#should_not' do
    it 'fails for invalid model' do
      lambda {@one_err.should_not have(1).error_on :name}.should fail
      lambda {@two_errs.should_not have(2).errors_on :name}.should fail
    end
  end
end
