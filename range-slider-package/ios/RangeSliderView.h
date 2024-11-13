#import <UIKit/UIKit.h>

/**
 * When using Swift classes in ObjC header, the class must have its
 * "forward declaration"
 *
 * @see https://developer.apple.com/documentation/swift/importing-swift-into-objective-c#Include-Swift-Classes-in-Objective-C-Headers-Using-Forward-Declarations
 */

@class RangeUISliderWrapper;
@protocol RangeUISliderWrapperDelegate;

@protocol RangeSliderViewDelegate
- (void) sendOnRangeSliderViewBeginDragEvent;
- (void) sendOnRangeSliderViewEndDragEventWithMinValue:(double)minValue maxValue:(double)maxValue;
- (void) sendOnRangeSliderViewValueChangeEventWithMinValue:(double)minValue maxValue:(double)maxValue;
@end


@interface RangeSliderView : UIView

@property (nonatomic, weak) id <RangeSliderViewDelegate> _Nullable delegate;

@property (nonatomic, strong) UIColor * _Nonnull activeColor;
@property (nonatomic, strong) UIColor * _Nonnull inactiveColor;

@property (nonatomic) double minValue;
@property (nonatomic) double maxValue;

@property (nonatomic) double leftKnobValue;
@property (nonatomic) double rightKnobValue;

@property (nonatomic) NSInteger step;

@property (nonatomic, copy) void ( ^ _Nullable onRangeSliderViewBeginDrag)(NSDictionary * _Nullable);
@property (nonatomic, copy) void (^ _Nullable onRangeSliderViewEndDrag)(NSDictionary * _Nullable);
@property (nonatomic, copy) void (^ _Nullable onRangeSliderViewValueChange)(NSDictionary * _Nullable);

@end



