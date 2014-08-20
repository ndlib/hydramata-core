# Hydramata::Translations

[![Version](https://badge.fury.io/rb/hydramata-translations.png)](http://badge.fury.io/rb/hydramata-translations)
[![Build Status](https://travis-ci.org/ndlib/hydramata-translations.png?branch=master)](https://travis-ci.org/ndlib/hydramata-translations)
[![Code Climate](https://codeclimate.com/github/ndlib/hydramata-translations.png)](https://codeclimate.com/github/ndlib/hydramata-translations)
[![Coverage Status](https://img.shields.io/coveralls/ndlib/hydramata-translations.svg)](https://coveralls.io/r/ndlib/hydramata-translations)
[![API Docs](http://img.shields.io/badge/API-docs-blue.svg)](http://rubydoc.info/github/ndlib/hydramata-work/master/frames/)
[![APACHE 2 License](http://img.shields.io/badge/APACHE2-license-blue.svg)](./LICENSE)

Responsible for providing a well defined data-structure to ease the interaction between differing layers of an application:

* Persistence Layer
* In Memory
* Rendering/Output Buffer

## Project Homepage

Are you looking for Demos and High Level Documentation? Take a look at the [Project Homepage](https://jeremyf.github.io/hydramata-translations).

Are you looking for the Code and how to Get Started? Then **this is the right place**.

## Getting Started

Presently Hydramata::Translations is a work in progress, and very much not ready for production usage.

But I would encourage you to:

1. Clone the repository: `git clone https://github.com/ndlib/hydramata-translations.git hydramata-translations`
1. Change to the repository's directory: `cd hydramata-translations`
1. Install the base dependencies: `bundle install`
1. Run the default rake task: `rake`

The rake task will build the internal rails application and run all of the tests.

Once you have the `spec/internal` directory built, you can run `rspec` or `rake spec:all`.

## Data Structure and Definition

<pre>
+-------------+         +--------------+
| Work        | >------ | WorkType     |
+-------------+         +--------------+
       |                       |
       ^                       ^
+-------------+         +--------------+
| PropertySet + >------ | PredicateSet |
+-------------+         +--------------+
       |                       |
       ^                       |
+-------------+         +--------------+
| Property    + >------ | Predicate    |
+-------------+         +--------------+
       |
       ^
+-------------+
| Value       +
+-------------+
</pre>


## Resources

* [Vision of Hydramata::Translations](./VISION.md)
* [Contributing Guidelines](./CONTRIBUTING.md)
* [Todo](./TODO.md)
* [Design Documents](./documents/) - as with any documentation these will less and less reflect the state of Hydramata::Translations but are a reference point.
* [Test related README](./spec/README.md)
