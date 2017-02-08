# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Added
- Created this Changelog.

### Changed
- APIError now unescapes some HTML entities from the provided message for
improved readability.

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

[Unreleased]: https://github.com/nomoon/lunanode/compare/v0.1.6...HEAD
[0.1.6]: https://github.com/nomoon/lunanode/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/nomoon/lunanode/compare/v0.0.1...v0.1.5
[0.0.1]: https://github.com/nomoon/lunanode/releases/tag/v0.0.1
