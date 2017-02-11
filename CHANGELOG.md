# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [0.3.0] - 2017-02-10
### Added
- New `api#image_rename` and `api#volume_rename` actions in the API. Thanks to
  the people at Luna Node for implementing them so quickly!
- (Testing) Some rudimentary RSpec tests.
- (Development) Reek code analyzer for code smells.
- (Development) Rubocop-rspec code analyzer for tests.

### Changed
- Cleaned up and broke apart larger action generator methods.
- Changed API definition file to use Ruby-style parameter types.
- Simplified how APIError displays messages.
- Improved Travis CI setup to include JRuby.
- Miscellaneous code smells and cleanups.

### Fixed
- `RestClient::Exception` was passed a non-existent parameter.

## [0.2.0] - 2017-02-08
### Added
- Created this Changelog.
- API calls will now print potentially-useful information if $DEBUG=true

### Changed
- Improved documentation (particularly for `API.new` and `API.params_for`).
- `API.new` will no longer instantiate without any parameters, though it is less
  fussy about its parameters now.
- APIError now unescapes some HTML entities from the provided message for
improved readability.
- APIError will also pretty-print JSON responses.

## [0.1.6] - 2017-02-08
### Changed
- Minor README improvements.

### Fixed
- Action names with hyphens were broken. The methods still use underscores
instead, but the proper hyphenated names are sent to the API.

## [0.1.5] - 2017-02-07
First public release.

### Changed
- Almost everything. Reorganized layout of gem to prepare for actual release.
This is the first point of reasonable functionality/stability.

## [0.0.1] - 2017-02-07
### Added
- Initial commit, not publicly released

[Unreleased]: https://github.com/nomoon/lunanode/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/nomoon/lunanode/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/nomoon/lunanode/compare/v0.1.6...v0.2.0
[0.1.6]: https://github.com/nomoon/lunanode/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/nomoon/lunanode/compare/v0.0.1...v0.1.5
[0.0.1]: https://github.com/nomoon/lunanode/releases/tag/v0.0.1
