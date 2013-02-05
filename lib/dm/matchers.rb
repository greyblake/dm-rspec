module DataMapper
  module Matchers

  end
end

require 'dm/matchers/belong_to'
require 'dm/matchers/have_one'
require 'dm/matchers/have_many'
require 'dm/matchers/have_many_and_belong_to'
require 'dm/matchers/have_many_through'

require 'dm/matchers/have_property'

require 'dm/matchers/validation_matcher'

require 'dm/matchers/validate_presence_of'
require 'dm/matchers/validate_uniqueness_of'
require 'dm/matchers/validate_format_of'
require 'dm/matchers/validate_length_of'
