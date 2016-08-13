//
//  Created by Jake Lin on 12/20/15.
//  Copyright © 2015 IBAnimatable. All rights reserved.
//

import UIKit

@IBDesignable public class AnimatableCheckBox: UIButton, CheckBoxDesignable, CornerDesignable, FillDesignable, BorderDesignable, ShadowDesignable, MaskDesignable, Animatable {
  
  // MARK: - CheckBoxDesignable
  @IBInspectable public var checked: Bool = false {
    didSet {
      configCheckBoxChecked()
    }
  }
  
  @IBInspectable public var checkedImage: UIImage? = nil {
    didSet {
      configCheckBoxCheckedImage()
    }
  }
  
  @IBInspectable public var uncheckedImage: UIImage? = nil {
    didSet {
      configCheckBoxUncheckedImage()
    }
  }
  
  // MARK: - CornerDesignable
  @IBInspectable public var cornerRadius: CGFloat = CGFloat.nan {
    didSet {
      configCornerRadius()
    }
  }
  
  // MARK: - FillDesignable
  @IBInspectable public var fillColor: UIColor? {
    didSet {
      configFillColor()
    }
  }
  
  @IBInspectable public var predefinedColor: String? {
    didSet {
      configFillColor()
    }
  }
  
  @IBInspectable public var opacity: CGFloat = CGFloat.nan {
    didSet {
      configOpacity()
    }
  }
  
  // MARK: - BorderDesignable
  @IBInspectable public var borderColor: UIColor? {
    didSet {
      configBorder()
    }
  }
  
  @IBInspectable public var borderWidth: CGFloat = CGFloat.nan {
    didSet {
      configBorder()
    }
  }
  
  public var borderSides: BorderSides  = .AllSides {
    didSet {
      configBorder()
    }
  }
  
  @IBInspectable public var _borderSides: String? {
    didSet {
      borderSides = BorderSides(rawValue: _borderSides)
    }
  }  
  // MARK: - ShadowDesignable
  @IBInspectable public var shadowColor: UIColor? {
    didSet {
      configShadowColor()
    }
  }
  
  @IBInspectable public var shadowRadius: CGFloat = CGFloat.nan {
    didSet {
      configShadowRadius()
    }
  }
  
  @IBInspectable public var shadowOpacity: CGFloat = CGFloat.nan {
    didSet {
      configShadowOpacity()
    }
  }
  
  @IBInspectable public var shadowOffset: CGPoint = CGPoint(x: CGFloat.nan, y: CGFloat.nan) {
    didSet {
      configShadowOffset()
    }
  }
  
  // MARK: - MaskDesignable
  public var maskType: MaskType = .none {
    didSet {
      configMask()
      configBorder()
    }
  }
  
  /// The mask type used in Interface Builder. **Should not** use this property in code.
  @IBInspectable var _maskType: String? {
    didSet {
      maskType = MaskType(string: _maskType)
    }
  }
  
  // MARK: - Animatable
public var animationType: AnimationType = .none
@IBInspectable  var _animationType: String? {
    didSet {
     animationType = AnimationType(string: _animationType)
    }
  }
  @IBInspectable public var autoRun: Bool = true
  @IBInspectable public var duration: Double = Double.nan
  @IBInspectable public var delay: Double = Double.nan
  @IBInspectable public var damping: CGFloat = CGFloat.nan
  @IBInspectable public var velocity: CGFloat = CGFloat.nan
  @IBInspectable public var force: CGFloat = CGFloat.nan
  @IBInspectable public var repeatCount: Float = Float.nan
  
  // MARK: - Lifecycle
  public override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
    configInspectableProperties()
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    setup()
    configInspectableProperties()
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    configAfterLayoutSubviews()
    autoRunAnimation()
  }
  
  public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if isTouchInside {
      checked = !checked
      sendActions(for: .valueChanged)
    }
    super.touchesEnded(touches, with: event)
  }
  
  // MARK: - Private
  private func setup() {
    // No title for CheckBox
    setTitle("", for: UIControlState())
    tintColor = .clear
  }
  
  private func configInspectableProperties() {
    configAnimatableProperties()
  }
  
  private func configAfterLayoutSubviews() {
    configMask()
    configBorder()
  }
}
