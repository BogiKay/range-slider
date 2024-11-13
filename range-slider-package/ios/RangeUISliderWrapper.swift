import RangeUISlider
import UIKit

class RangeUISliderObject {
    public weak var delegate: RangeUISliderWrapperDelegate? = nil
    
    public var slider: RangeUISlider = {
        let rangeSlider = RangeUISlider()
        
        rangeSlider.barCorners = 5
        rangeSlider.barHeight = 10
        rangeSlider.leftKnobColor = UIColor.systemBlue
        rangeSlider.leftKnobCorners = 10
        rangeSlider.leftKnobHeight = 20
        rangeSlider.leftKnobWidth = 20
        rangeSlider.rightKnobColor = UIColor.systemBlue
        rangeSlider.rightKnobCorners = 10
        rangeSlider.rightKnobHeight = 20
        rangeSlider.rightKnobWidth = 20
        rangeSlider.showKnobsLabels = true

        return rangeSlider
    }()
    
    private var isDragging = false
    
    init () {
        self.slider.delegate = self
    }
}

extension RangeUISliderObject: RangeUISliderDelegate {
    public func rangeIsChanging(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        self.delegate?.sendOnRangeSliderViewValueChangeEvent(minValue: minValueSelected, maxValue: maxValueSelected)
    }
    
    public func rangeChangeStarted() {
        self.isDragging = true
        self.delegate?.sendOnRangeSliderViewBeginDragEvent()
    }
    
    public func rangeChangeFinished(minValueSelected: CGFloat, maxValueSelected: CGFloat, slider: RangeUISlider) {
        if !isDragging {
            return
        }
        
        self.delegate?.sendOnRangeSliderViewEndDragEvent(minValue: minValueSelected, maxValue: maxValueSelected)
        self.isDragging = false
    }
}

@objc(RangeUISliderWrapperDelegate)
public protocol RangeUISliderWrapperDelegate: AnyObject {
    func sendOnRangeSliderViewBeginDragEvent()
    func sendOnRangeSliderViewEndDragEvent(minValue: Double, maxValue: Double)
    func sendOnRangeSliderViewValueChangeEvent(minValue: Double, maxValue: Double)

}

@objc(RangeUISliderWrapper)
public class RangeUISliderWrapper: NSObject {
    private var sliderObject = RangeUISliderObject()

    @objc public weak var delegate: RangeUISliderWrapperDelegate? = nil {
        didSet {
            sliderObject.delegate = delegate
        }
    }
    
    @objc public var activeColor: UIColor = UIColor.systemBlue {
        didSet {
            sliderObject.slider.rangeSelectedColor = activeColor
        }
    }

    @objc public var inactiveColor: UIColor = UIColor.systemGray {
        didSet {
            sliderObject.slider.rangeNotSelectedColor = inactiveColor
        }
    }

    @objc public var minValue: Double = 0.0 {
        didSet {
            sliderObject.slider.scaleMinValue = minValue
        }
    }

    @objc public var maxValue: Double = 1.0 {
        didSet {
            sliderObject.slider.scaleMaxValue = maxValue
        }
    }

    @objc public var leftKnobValue: Double = 0.0 {
        didSet {
            sliderObject.slider.changeLeftKnob(value: leftKnobValue)
            sliderObject.slider.defaultValueLeftKnob = leftKnobValue
        }
    }

    @objc public var rightKnobValue: Double = 1.0 {
        didSet {
            sliderObject.slider.changeRightKnob(value: rightKnobValue)
            sliderObject.slider.defaultValueRightKnob = rightKnobValue
        }
    }

    @objc public var step: Int = 0 {
        didSet {
            sliderObject.slider.stepIncrement = CGFloat(step)
        }
    }
    
    @objc public var slider: UIView {
        get {
            return sliderObject.slider
        }
    }
}
