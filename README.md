## MagiConstraints
Syntactic sugar for AutoLayout to speed up making constraints in one-line-function like magic ✨
[![CI Status](https://img.shields.io/travis/BelalSamy/MagiConstriants.svg?style=flat)](https://travis-ci.org/BelalSamy/MagiConstriants)
[![Version](https://img.shields.io/cocoapods/v/MagiConstriants.svg?style=flat)](https://cocoapods.org/pods/MagiConstriants)
[![License](https://img.shields.io/cocoapods/l/MagiConstriants.svg?style=flat)](https://cocoapods.org/pods/MagiConstriants)
[![Platform](https://img.shields.io/cocoapods/p/MagiConstriants.svg?style=flat)](https://cocoapods.org/pods/MagiConstriants)

## Features
- [X] Constraints are active by default.
- [X] No need to set `translatesAutoresizingMaskIntoConstraints` because `MagiConstraints` does it for you.
- [X] Satisfy all constraints `X-axis`, `Width`, `Y-axis` & `Height` in one line function `magiConstraints()`
- [X] by covering different ways to statisfy each constraint using `enum` parameters
- [X] also have `miniConstraints()` function to use constraints individually 
- [X] create dynamic `UIScrollView` by one line function `magiCreate`
- [X] create `UIStackView` by one line function `magiCreate`


## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation
MagiConstriants is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MagiConstriants'
```

## Usage
Constraints behave different if it's attach to `superview` or `any other view`
 `nil = superview` by default, so its easy to change superview without change alot of code 

### superview :
- [X] leading to `leading` of  superview
- [X] trailling to `trailing` of superview
- [X] top to `top` of superview
- [X] bottom to `bottom` of superview

### any other view :
- [X] leading to `trailing` of view
- [X] trailling to `leading` of view
- [X] top to `bottom` of view
- [X] bottom to `top` of view

### magiConstraints 
```swift
// write the code here 
```
### miniConstraints
```swift
// write the code here 
```
### Dynamic UIScrollView
```swift
// write the code here 
```
### UIStackView
```swift
// write the code here 
```


## Enums Cases

| X-axis (X)  | description |
| ------------- | ------------- |
| leading | takes 2 parameters `UIView` for the view and `CGFloat`  for constant padding value |
| trailing  | takes 2 parameters `UIView` for the view and `CGFloat`  for constant padding value |
| center  | takes 1 parameter `UIView` for the view ( center horizontally ) |

| Width (W) | desciption |
| ------------- | ------------- |
| wrapContent | dynamic width grows and shrinks according to the content of the view |
| fixed  | takes 1 parameter `CGFloat`  for constant width value |
| equal  | takes 2 parameters `UIView` for the view and `CGFloat`  for multiplier value |

| Y-axis (Y)  | description |
| ------------- | ------------- |
| top | takes 2 parameters `UIView` for the view and `CGFloat`  for constant padding value |
| bottom  | takes 2 parameters `UIView` for the view and `CGFloat`  for constant padding value |
| center  | takes 1 parameter `UIView` for the view ( center vertically ) |

| Height (H) | desciption |
| ------------- | ------------- |
| wrapContent | dynamic width grows and shrinks according to the content of the view |
| fixed  | takes 1 parameter `CGFloat`  for constant height value |
| equal  | takes 2 parameters `UIView` for the view and `CGFloat`  for multiplier value |

| X-axis & Width (XW) | description |
| ------------- | ------------- |
| leadingAndCenter | takes 2 parameters `UIView` for the view and `CGFloat`  for constant padding value ( Always center Horizontally to the superview |
| trailingAndCenter  | takes 2 parameters `UIView` for the view and `CGFloat`  for constant padding value ( Always center Horizontally to the superview |
| leadingAndTrailing  | takes 4 parameters `UIView` for the leadingView and `CGFloat`  for constant padding value + another `UIView` for the trailingView and `CGFloat`  for constant padding value |
| leadingAndTrailingAndHeight  | takes 5 parameters `UIView` for the leadingView and `CGFloat`  for constant padding value + another `UIView` for the trailingView and `CGFloat`  for constant padding value + `W` enum as a parameter to set the Width |

| Y-axis & Height (YH) | description |
| ------------- | ------------- |
| topAndCenter | takes 2 parameters `UIView` for the view and `CGFloat`  for constant padding value ( Always center vertically to the superview |
| bottomAndCenter | takes 2 parameters `UIView` for the view and `CGFloat`  for constant padding value ( Always center vertically to the superview |
| topAndBottom | takes 4 parameters `UIView` for the topView and `CGFloat`  for constant padding value + another `UIView` for the bottomView and `CGFloat`  for constant padding value |
| topAndBottomAndHeight | takes 5 parameters `UIView` for the topView and `CGFloat`  for constant padding value + another `UIView` for the bottomView and `CGFloat`  for constant padding value + `H` enum as a parameter to set the Height |


## Author

BelalSamy, belalsamy10@gmail.com

## License

MagiConstriants is available under the MIT license. See the LICENSE file for more info.
