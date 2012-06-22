# dm-rspec2 (RSpec 2 matchers for DataMapper)
by svs

based on the work of Potapov Sergey at [https://github.com/greyblake/dm-rspec](https://github.com/greyblake/dm-rspec)

A set of rspec matchers to test DataMapper models like you test ActiveRecord models with rspec-rails that work with and use RSpec 2 matcher DSL

## Installation

    gem install dm-rspec2 # not published yet!

## Usage
    
Add the following to your `spec_helper`:

    require 'dm-rspec'
    
    RSpec.configure do |config|
      config.include(DataMapper::Matchers)
    end

In your spec files you can use the following matchers to test appropriate DataMapper's validations:

* belong\_to
* have\_one
* have\_many
* have\_many\_and\_belong\_to
* have\_property(:property_name).of_type(DataMapper::Property::String)
* have(n).errors\_on(:property)
* have\_many(:association).trough(:another\_association)
* validate\_presence\_of(:property)
* validate\_uniqueness\_of(:property)
* validate\_format\_of(:property).with(/regexp/)
* validate\_inclusion_\_of(:property).within([1,2,3])


## Examples

Assume you have the following data mapper models:

    class Book
      include DataMapper::Resource
      property :id, Serial
      property :name, String
      belongs_to :author
      has n, :genres, :through => Resource
      validates_presence_of :name
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

Your specs can contain the following:

    specify {Book.should have_property :name}
    specify {Book.should belong_to :author}
    specify {Author.should have_many :books}
    specify {Genre.should  have_many_and_belong_to :books}
    specify {Book.should  have_many_and_belong_to :genres}

    specify {Book.should validate_presence_of :name}

    it 'has errors' do
      book = Book.new(:name => 'fails on two validations')
      book.valid?
      book.should have(2).errors_on(:name)
    end

They can look like below as well:

    describe Book do
      it { should have_property :name   }
      it { should  belongs_to   :author }
    end




## TODO

Update all the matchers to RSpec 2 format (see have_property.rb for an example)


## Contributing to dm-rspec
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.


## License

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/lgpl.txt>
