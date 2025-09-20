## [1.4.1] - 20.09.2025

- Update packages

## [1.4.0] - 30.09.2023

- Update dart version constraints to ">=2.17.0 <4.0.0"

## [1.3.3] - 30.09.2023

- Update dependencies
- Fix typo in README

## [1.3.2] - 15.04.2023

- Update dependencies
- Apply updated linting rules

## [1.3.1] - 30.01.2023

- Added screenshots to pubspec.yaml
- Fixed typo in README

## [1.3.0] - 07.09.2022

- Add the possibility to pass `ListViewBuilderOptions` to the `ResponsiveGridList` widget
- Add the possibility to pass `SliverChildBuilderDelegateOptions` to the `ResponsiveSliverGridList` widget
- Deprecate the `shrinkWrap` property of `ResponsiveGridList`. Use `listViewBuilderOptions.shrinkWrap` instead.
- Update dart version constraints to >=2.17.0
- Use very_good_analysis as linter

## [1.2.5] - 17.07.2022

- Update dependencies
- Add tests

## [1.2.4] - 04.03.2022

- Add `minItemsPerRow` property

## [1.2.3] - 20.10.2021

- Add `maxItemsPerRow` property
- Add `ResponsiveGridListBuilder` to allow usage with any List / Column.

## [1.2.2] - 14.10.2021

- Add `shrinkWrap` property for `ResponsiveGridList`

## [1.2.1] - 09.08.2021

- Update README

## [1.2.0] - 12.04.2021

- Added ability to add spacing around the grid with `horizontalGridMargin` and `verticalGridMargin`
- Added ability to customize horizontal and vertical spacing between grid items with `horizontalGridSpacing` and `verticalGridSpacing`

### Migrating from version [1.1.0]

- Replace `spacing` with `horizontalGridSpacing` and `verticalGridSpacing`

## [1.1.0] - 08.03.2021

- Updated dependencies and package to null safety

## [1.0.1] - 12.02.2021

- The `rowMainAxisAlignment` can now be set on the GridList's

## [1.0.0] - 11.02.2021

- Initial Release of responsive_grid_list
- `ResponsiveGridList` and `ResponsiveSliverGridList` are available
