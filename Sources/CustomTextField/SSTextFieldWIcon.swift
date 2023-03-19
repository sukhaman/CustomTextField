//
//
// Created by Sukhaman Singh
// 
//


import UIKit

public class SSTextFieldWIcon: UITextField {

    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
            var textRect = super.leftViewRect(forBounds: bounds)
            textRect.origin.x += leftPadding
            return textRect
        }
        
        @IBInspectable public var leftImage: UIImage? {
            didSet {
                updateView()
            }
        }
        
        @IBInspectable public var leftPadding: CGFloat = 0
        
        @IBInspectable public var color: UIColor = UIColor.lightGray {
            didSet {
                updateView()
            }
        }
    
    @IBInspectable public var bgColor: UIColor = UIColor.black
        
        func updateView() {
            if let image = leftImage {
                leftViewMode = UITextField.ViewMode.always
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                imageView.image = image
                let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
                imageContainerView.addSubview(imageView)
                leftView = imageContainerView
                imageView.contentMode = .scaleAspectFit
                imageView.tintColor = color
                
                leftView = imageContainerView
            } else {
                leftViewMode = UITextField.ViewMode.never
                leftView = nil
            }
            // Placeholder text color
            if self.bgColor == UIColor.black {
                attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: UIColor.white])

            } else {
                attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: UIColor.black])

            }
        }
   public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    public convenience init(placeholder: String, fontSize: CGFloat, fontName: String = "", keyboardType: UIKeyboardType = .default, returnKeyType: UIReturnKeyType = .done, borderWidth: CGFloat = 1, borderColor: CGColor = UIColor.lightGray.cgColor, cornerRadius: CGFloat = 0, textColor: UIColor = .black, alignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        self.placeholder = placeholder
        if fontName == "" {
            self.font = .systemFont(ofSize: fontSize)
        } else {
        self.font = UIFont(name: fontName, size: fontSize)
        }
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
       self.layer.borderColor = borderColor
       self.layer.borderWidth = borderWidth
       self.layer.cornerRadius = cornerRadius
       self.textColor = textColor
       self.textAlignment = textAlignment
       
    }
    
    private func configure() {
        textColor = .black
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 10
        
    }
    
    
    
    let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 10)
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
    
    

}

