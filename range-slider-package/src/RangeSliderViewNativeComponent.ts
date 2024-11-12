import type * as React from 'react';
import type {ColorValue, HostComponent, ViewProps} from 'react-native';
import type {
  DirectEventHandler,
  Double,
  Int32,
} from 'react-native/Libraries/Types/CodegenTypes';
import codegenNativeCommands from 'react-native/Libraries/Utilities/codegenNativeCommands';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

type SliderValues = Readonly<{
  leftKnobValue: Double;
  rightKnobValue: Double;
}>;

export type OnRangeSliderViewEndDragEventData = SliderValues;

export type OnRangeSliderViewValueChangeEventData = SliderValues;

export interface RangeSliderViewProps extends ViewProps {
  activeColor?: ColorValue;
  inactiveColor?: ColorValue;
  leftKnobValue: Double;
  rightKnobValue: Double;
  minValue?: Double;
  maxValue?: Double;
  onRangeSliderViewBeginDrag?: DirectEventHandler<null>;
  onRangeSliderViewEndDrag?: DirectEventHandler<OnRangeSliderViewEndDragEventData>;
  onRangeSliderViewValueChange?: DirectEventHandler<OnRangeSliderViewValueChangeEventData>;
  step?: Int32;
}

export type RangeSliderViewComponent = HostComponent<RangeSliderViewProps>;

export interface RangeSliderViewNativeCommands {
  setLeftKnobValueProgrammatically: (
    viewRef: React.ElementRef<RangeSliderViewComponent>,
    value: Double,
  ) => void;
  setRightKnobValueProgrammatically: (
    viewRef: React.ElementRef<RangeSliderViewComponent>,
    value: Double,
  ) => void;
}

export const RangeSliderViewNativeCommands =
  codegenNativeCommands<RangeSliderViewNativeCommands>({
    supportedCommands: [
      'setLeftKnobValueProgrammatically',
      'setRightKnobValueProgrammatically',
    ],
  });

export default codegenNativeComponent<RangeSliderViewProps>(
  'RangeSliderView',
) as RangeSliderViewComponent;
