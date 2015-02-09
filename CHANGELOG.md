# ODSAccordionView CHANGELOG

## 0.4.5

[new feature] New features in ODSAccordionSectionStyle (arrow height, animation duration)
[new feature] Option to auto expand panel

## 0.4.1, 0.4.2, 0.4.3, 0.4.4

[bugfixes] Several smaller bugfixes and tweaks

## 0.4.0

[improvement] Sections now use the [UIView sizeThatFits:(CGSize) size] method to determine the height of the sections view instead of the frame/bounds of the view.
[bugfix] Fixes a key-value-observing deregistration warning

## 0.3.3

[bugfix] Fixes an issue resizing views inside accordion sections

## 0.3.2

[bugfix] Fixes an issue where sticky headers could not be disabled

[bugfix] Only make headers transparent when sticky headers are activated

## 0.3.1

[bugfix] Fixes an issue where sticky headers would not work with translucent menu bars 

## 0.3.0

[new feature] Option to keep section headers always visible on top while scrolling, similar to UITableView (sticky headers)

[improvement] Improved ODSAccordionSectionStyle with: Well-defined default values, ODSAccordionHeaderStyle enum, optionally hide the arrow

[improvement] Widget will immediately scroll to make some of the just expanded section is visible if necessary, instead of waiting for animations to complete

[bugfix] Fixes an issue where a tap on the arrow would cause events to be swallowed

[bugfix] Fixes an issue where the KVO observer was not properly deregistered

## 0.2.1

[bugfix] Fixes the podspec

## 0.2.0

[improvement] Added the option to display a disclosure arrow

## 0.1.1

[bugfix] several minor bugfixes

## 0.1.0

Initial release.
