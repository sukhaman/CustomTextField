//
//  
// Created by Sukhaman Singh
//  
//

import UIKit

public class SSTextField: UITextField {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    @IBInspectable public var bgColor: UIColor = UIColor.black
    @IBInspectable public var layerColor: UIColor = UIColor.lightGray
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
       
        translatesAutoresizingMaskIntoConstraints = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        leftView = paddingView
        leftViewMode = UITextField.ViewMode.always
        
    }
    
    
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
    
    

}

