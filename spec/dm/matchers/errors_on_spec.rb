require 'spec_helper'


describe 'have errors_on' do
  before(:all) do
    @valid = Book.new(:name => 'War and Peace')
    @one_err = Book.new(:name => 'too short')
    @two_errs = Book.new
  end


  context '#should' do
    it 'passes' do
      lambda {expect((@one_err.error_on :name).size).to eq(1)}.should_pass
      lambda {expect((@two_errs.errors_on :name).size).to eq(2)}.should_pass
      lambda {expect((@valid.errors_on :name).size).to eq(0)}.should_pass
    end

    it 'fails for valid mode' do
      expect {expect(@valid.errors_on :name.size).to eq(1)}.to fail
    end
  end

  context '#should_not' do
    it 'fails for invalid model' do
      expect {expect((@one_err.error_on :name).size).not_to eq(1)}.to fail
      expect {expect((@two_errs.errors_on :name).size).not_to eq(2)}.to fail
    end
  end
end
