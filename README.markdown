# dm-rspec (RSpec matchers for DataMapper)
by Potapov Sergey (aka Blake)

A set of rspec matchers to test DataMapper models like you test ActiveRecord models with rspec-rails.


## Installation

    gem install dm-rspec


## Usage
    
Add the next to your `spec_helper`:

    require 'dm-rspec'
    
    RSpec.configure do |config|
      config.include(DataMapper::Matchers)
    end

In your spec files you can use the next matchers to test appropriate DataMapper's validations:

* belong\_to
* have\_many
* have\_many\_and\_belong\_to
* have\_property
* have(n).errors\_on(:property)
* have\_many(:association).trough(:another\_association)
* validate\_presence\_of(:property)
* validate\_uniqueness\_of(:property)
* validate\_format\_of(:property).with(/regexp/)


## Examples

Assume you have the next data mapper models:

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

You specs can contain the next:

    specify {Book.should have_property :name}
    specify {Book.should belong_to :author}
    specify {Author.should have_many :books}
    specify {Genre.should  have_many_and_belong_to :books}
    specify {Books.should  have_many_and_belong_to :genres}

    specify {Books.should validates_presence_of :name}

    it 'has errors' do
      book = Book.new(:name => 'fails on two validations')
      book.valid?
      book.should have(2).errors_on(:name)
    end



## TODO

Implement the next rspec matchers:

* have timestamps
* matchers to verify validations


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
