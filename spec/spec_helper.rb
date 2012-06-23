$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'dm-core'
require 'dm-types'
require 'dm-validations'
require 'dm-migrations'
require 'dm-sqlite-adapter'

require 'dm-rspec'


DataMapper.setup(:default, "sqlite3::memory:")

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
  has 1, :foreword
  has n, :genres, :through => Resource
  has n, :taggings
  has n, :tags, :through => :taggings
  validates_presence_of :name
  validates_uniqueness_of :name, :message => 'Book name must be unique!'
  validates_length_of :name, :min => 10
end

class Author
  include DataMapper::Resource
  property :id, Serial
  property :first_name, String
  property :last_name, String
  has n, :books
  validates_uniqueness_of :last_name
end

class Genre
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  has n, :books, :through => Resource
  validates_uniqueness_of :name, :message => 'Genre name must be unique!'
  validates_format_of :name, :with => /\w+/, :message => "Bad format of genre"
end

class Tag
  include DataMapper::Resource
  property :id, Serial
  has n, :taggings
  has n, :books, :through => :taggings
  property :name, String
  validates_format_of :name, :with => /\w+/
end

class Tagging
  include DataMapper::Resource
  property :id, Serial
  belongs_to :tag
  belongs_to :book
end

# To test validates_presence_of
class Person
  include DataMapper::Resource
  property :id, Serial
  property :first_name, String
  property :last_name , String
  property :age       , Integer
  property :gender    , Enum["male","female"]
  validates_presence_of :first_name, :message => 'Where is the first name?'
  validates_presence_of :last_name
end

class Foreword
  include DataMapper::Resource
  property :id, Serial
end

DataMapper.finalize
DataMapper.auto_migrate!
