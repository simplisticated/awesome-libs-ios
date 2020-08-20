//
//  ContainerView.swift
//  Visuality
//
//  Created by Igor Matyushkin on 27.03.16.
//  Copyright © 2016 Igor Matyushkin. All rights reserved.
//

import UIKit

public class ContainerView: UIView {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInitialization()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInitialization()
    }
    
    // MARK: Deinitializer
    
    deinit {
        // Remove references
        
        self._contentView = nil
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    fileprivate var _contentView: UIView?
    
    public var contentView: UIView? {
        get {
            return _contentView
        }
        set {
            // Remove previous content view if needed
            
            if self._contentView != nil {
                self._contentView!.removeFromSuperview()
            }
            
            // Update private variable
            
            self._contentView = newValue
            
            // Update view
            
            if newValue != nil {
                newValue!.frame = bounds
                self.addSubview(newValue!)
            }
        }
    }
    
    // MARK: Public object methods
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update content view
        
        self.contentView?.frame = bounds
    }
    
    public func setContentView<ContentView: UIView>(ofType contentViewType: ContentView.Type, fromNib nibQuery: NibQuery, locatedInBundle bundleQuery: BundleQuery, andConfigure configureContentView: ((_ contentView: ContentView) -> Void)?) {
        // Create new content view
        
        let viewInitializer = ViewInitializer(viewClass: ContentView.self)
        let newContentView = viewInitializer.view(fromNib: nibQuery, locatedInBundle: bundleQuery)
        
        // Update current content view
        
        self.contentView = newContentView
        
        // Configure new content view if needed
        
        configureContentView?(newContentView)
    }
    
    // MARK: Private object methods
    
    fileprivate func customInitialization() {
        // Initialize view
        
        backgroundColor = .clear
    }
    
    // MARK: Actions
    
    // MARK: Protocol methods
    
}
