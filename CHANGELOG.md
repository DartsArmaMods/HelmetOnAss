# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.8]

### Added

- Add [keep a changelog](https://keepachangelog.com) style changelog from [@DartRuffian]
- Add helmet throwing from [@DartRuffian]
- Add ability to unsling items when you have a helmet equipped from [@DartRuffian]
- Add "sling all" sling mode for helmet, nvgs, and facewear from [@DartRuffian]
- Add root action for ACE actions from [@DartRuffian]
- Add sling mode option to Zeus Module from [@DartRuffian]
- Add ZEN context menu actions to units to (un)sling items from [@DartRuffian]
- Drop slung items on ground when a unit is killed from [@DartRuffian]

### Changed
- Delete ground holders when empty from [@DartRuffian]
- Fix sometimes accidentally removing items from [@DartRuffian]
- Move vehicle getIn/getOut code to client from [@DartRuffian]
- Standardized setting/keybind names, will break from [@DartRuffian]

### Removed
- Remove allowed sling modes and can hide items settings from [@DartRuffian]
- Remove `_items` parameter from `fnc_slingItems` from [@DartRuffian]

## [1.1.7] - 2026-10-19

### Changed

- Combine compatibility patches from [@DartRuffian]
- Temporary fix for slung items after exiting a vehicle from [@DartRuffian]

## [1.1.6] - 2026-3-16

### Changed

- Potential fix for vehicle sling issue from [@DartRuffian]

## [1.1.5] - 2026-2-22

### Changed

- Fix items saying they're unavailable in a full arsenal from [@DartRuffian]
- Fix ACE Arsenal action not being stringtabled from [@DartRuffian]
- Fix not re-hiding objects if set when exiting a vehicle from [@DartRuffian]

## [1.1.4] - 2026-1-12

### Changed

- Fix creating slung items when loading loadouts from [@DartRuffian]

## [1.1.3] - 2025-9-16

### Changed

- Potential fix for vehicle sling issue from [@DartRuffian]
- Allow (un)slinging items while sitting and in water from [@DartRuffian]
- Prevent "smuggling" slung items into limited from [@DartRuffian]
- Fix vector math in pitchBankYawToVector from [@DartRuffian]

## [1.1.2] - 2025-6-24

### Changed

- Fix typo in Gendarmerie sling mode from [@DartRuffian]
- Fix missing newlines in files from [@DartRuffian]

### Removed

- Remove Immersion Cigs compat, included in Immersion Cigs mod from [@DartRuffian]

## [1.1.1] - 2025-5-29

### Added

- Add Gendarmerie sling position from [@DartRuffian]
- Add sling modes from [@DartRuffian]
- Add UI for Sling Items module from [@DartRuffian]
- Add setting to disable ability to hide items from [@DartRuffian]

### Changed

- Fix being able to access ground holders from [@DartRuffian]
- Fix ground holders having ACE Actions from [@DartRuffian]
- Move zeus modules to new zeus component from [@DartRuffian]

### Removed

- Remove Immersion Cigs compat, included in Immersion Cigs mod from [@DartRuffian]
- Remove unused stringtable keys from [@DartRuffian]

## [1.0.4] - 2025-5-27

### Added

- Add Immersion Cigs compat from [@DartRuffian]
- Add Misriah Armory compat from [@DartRuffian]

## [1.0.3] - 2025-5-27

### Changed

- Fix swapHelmets not using cache from [@DartRuffian]

## [1.0.2] - 2025-5-27

### Changed

- Fix facewear being rotated when slung from [@DartRuffian]

## [1.0.1] - 2025-5-26

### Changed

- Fix not properly getting position and rotation from uniform from [@DartRuffian]

## [1.0.0] - 2025-5-25

### Added

- Initial release from [@DartRuffian]

[1.1.8]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.1.7...v1.1.8
[1.1.7]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.1.6...v1.1.7
[1.1.6]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.1.5...v1.1.6
[1.1.5]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.1.4...v1.1.5
[1.1.4]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.1.3...v1.1.4
[1.1.3]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.1.2...v1.1.3
[1.1.2]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.0.4...v1.1.1
[1.0.4]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.0.3...v1.0.4
[1.0.3]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.0.2...v1.0.3
[1.0.2]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/DartsArmaMods/HelmetOnAss/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/DartsArmaMods/HelmetOnAss/releases/v1.0.0
[@DartRuffian]: https://github.com/DartRuffian
