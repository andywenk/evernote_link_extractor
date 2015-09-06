# EvernoteLinkExtractor

[![Build Status](https://travis-ci.org/andywenk/evernote_link_extractor.svg?branch=master)](https://travis-ci.org/andywenk/evernote_link_extractor)

If you are planning to remove Evernote from your system due to any reason, you might want to keep the links you collected
in your notes. This little gem will create a CSV file with a title and link of your collected URL's. It assumes you
have exported your notes as html files. You can easily do this by following these instructions (also shown
  when you run the program):

  * Open the Evernote programm
  * click Notes in the navigation (on the left)
  * klick ctrl+a to mark all Notes
  * klick File > Export Notes... in the top navigation
  * choose HTML as Format:
  * choose a directory on a hard drive and click save

A folder with the extension .enex is being created. All your Notes are stored there as HTML files.

## This is Alpha software

I created this little gem out of the need to somehow extract the Evernote URL's from my notes. Please be aware, that this is Alpha software and may produce bugs. Use it at your onw risk ;-).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'evernote_link_extractor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install evernote_link_extractor

## Usage

When you have installed the gem, you can simply run it on the command line by typing

    evernote_link_extractor

You will be asked where the folder with your exported notes html files is. After that, a CSV file will be created
in the directory wher you run the program. And that's it.

![cli example](https://drive.google.com/open?id=0B2xXhdpvuHcGOFg1czE2U2NzRVE)

## Bugs

Please see and report any bugs to [Issues section of the Github repository](https://github.com/andywenk/evernote_link_extractor/issues)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andywenk/evernote_link_extractor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

### Used gems

* [Nokogiri - for HTML parsing](https://github.com/sparklemotion/nokogiri)
* [Pastel - for fancy command line colors](https://github.com/peter-murach/pastel)

## License (Apache2)

Copyright (c) 2015 Andreas Wenk

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
