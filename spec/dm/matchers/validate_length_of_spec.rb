require 'spec_helper'

describe 'validate_length_of' do
  context '#should' do
    it 'validates length' do
      lambda { Publisher.should validate_length_of(:name).length(128) }.should_pass
      lambda { Publisher.should validate_length_of(:name).length(129) }.should_fail
    end
    it 'validates maximum' do
      lambda { Publisher.should validate_length_of(:name).maximum(128) }.should_pass
      lambda { Publisher.should validate_length_of(:name).maximum(129) }.should_fail
              
      lambda { Publisher.should validate_length_of(:address).maximum(2000) }.should_pass
      lambda { Publisher.should validate_length_of(:address).maximum(1024) }.should_fail
    end
    it 'validates max' do
      lambda { Publisher.should validate_length_of(:name).max(128) }.should_pass
      lambda { Publisher.should validate_length_of(:name).max(129) }.should_fail
    end
    
    it 'validates minimum' do
      lambda { Publisher.should validate_length_of(:city).minimum(2) }.should_pass
      lambda { Publisher.should validate_length_of(:city).minimum(3) }.should_fail
    end
    it 'validates min' do
      lambda { Publisher.should validate_length_of(:city).min(2) }.should_pass
      lambda { Publisher.should validate_length_of(:city).min(1) }.should_fail
    end
    
    it 'validates within' do
      lambda { Publisher.should validate_length_of(:phone).within(5..15) }.should_pass
      lambda { Publisher.should validate_length_of(:phone).within(4..15) }.should_fail
      lambda { Publisher.should validate_length_of(:phone).within(5..14) }.should_fail
      lambda { Publisher.should validate_length_of(:phone).within(5) }.should_fail
    end
    it 'validates in' do
      lambda { Publisher.should validate_length_of(:phone).in(5..15) }.should_pass
      lambda { Publisher.should validate_length_of(:phone).in(4..16) }.should_fail
    end
    
    it 'validates equals' do
      lambda { Publisher.should validate_length_of(:zip).equals(6) }.should_pass
      lambda { Publisher.should validate_length_of(:zip).equals(7) }.should_fail
    end
    it 'validates is' do
      lambda { Publisher.should validate_length_of(:zip).is(6) }.should_pass
      lambda { Publisher.should validate_length_of(:zip).is(7) }.should_fail
    end
  end
end
