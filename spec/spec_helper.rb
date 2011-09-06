$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'dm-core'
require 'dm-validations'

require 'dm-rspec'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}


RSpec.configure do |config|
  config.include(DataMapper::Matchers)
end


# helper matchers for testing dm-rspec matchers
#
def fail()
  raise_error(RSpec::Expectations::ExpectationNotMetError)
end
  
def fail_with(message)
  raise_error(RSpec::Expectations::ExpectationNotMetError,message)
end

class Proc
  include ::RSpec::Matchers
  def should_pass
    lambda { self.call }.should_not raise_error
  end
end


# Models for testing
#
class Book
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  belongs_to :author
  has n, :genres, :through => Resource
  has n, :taggings
  has n, :tags, :through => :taggings
  validates_presence_of :name
  validates_length_of :name, :min => 10
end

class Author
  include DataMapper::Resource
  property :id, Serial
  has n, :books
end

class Genre
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  has n, :books, :through => Resource
end

class Tag
  include DataMapper::Resource
  property :id, Serial
  has n, :taggings
  has n, :books, :through => :taggings
end

class Tagging
  include DataMapper::Resource
  belongs_to :tag
  belongs_to :book
end

debugger

1 + 1
