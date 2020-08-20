import Foundation
import UIKit

public class BadgeView: UIView {
    
    private var label: UILabel!
    
    @IBInspectable public var badgeColor: UIColor? {
        didSet {
            self.backgroundColor = self.badgeColor ?? .black
        }
    }
    
    @IBInspectable public var textColor: UIColor? {
        didSet {
            self.label.textColor = self.textColor ?? .white
        }
    }
    
    @IBInspectable public var font: UIFont? {
        didSet {
            self.label.font = self.font ?? .systemFont(ofSize: 12, weight: .bold)
        }
    }
    
    @IBInspectable public var text: String? {
        didSet {
            self.label.text = self.text
            
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialize()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let labelMargin = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        let labelFrame = self.bounds.inset(
            by: labelMargin
        )
        self.label.frame = labelFrame
        
        let requiredLabelWidth = self.label.sizeThatFits(
            .init(
                width: CGFloat.greatestFiniteMagnitude,
                height: labelFrame.height
            )
        ).width
        
        if let widthConstraint = self.constraints.first(where: { (constraint) -> Bool in
            return constraint.firstAttribute == .width
        }) {
            widthConstraint.constant = requiredLabelWidth + labelMargin.left + labelMargin.right
        }
    }
    
    private func initialize() {
        self.setupView()
        self.setupLabel()
        self.badgeColor = nil
        self.textColor = nil
        self.font = nil
    }
    
    private func setupView() {
        self.layer.cornerRadius = 10
    }
    
    private func setupLabel() {
        let label = UILabel()
        label.textAlignment = .center
        self.addSubview(label)
        self.label = label
    }
}
