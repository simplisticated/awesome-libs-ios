//
//  ScrollableContainerView.swift
//  Visuality
//
//  Created by Igor Matyushkin on 06.11.16.
//  Copyright © 2016 Igor Matyushkin. All rights reserved.
//

import UIKit

public class ScrollableContainerView: UIView {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    fileprivate class func defaultScrollDirection() -> ScrollDirection {
        return .vertical
    }
    
    // MARK: Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customInitialization()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInitialization()
    }
    
    // MARK: Deinitializer
    
    deinit {
        // Remove references
        
        lastContentSize = nil
        _internalScrollView = nil
        _contentView = nil
        _scrollDirection = nil
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    fileprivate var lastContentSize: CGSize!
    
    fileprivate var _internalScrollView: UIScrollView!
    
    fileprivate var internalScrollView: UIScrollView {
        get {
            return _internalScrollView
        }
    }
    
    fileprivate var _contentView: UIView?
    
    public var contentView: UIView? {
        get {
            return _contentView
        }
        set {
            // Update content view
            
            setContentView(contentView: newValue, forScrollDirection: scrollDirection)
        }
    }
    
    fileprivate var _scrollDirection: ScrollDirection!
    
    public var scrollDirection: ScrollDirection {
        get {
            return _scrollDirection
        }
        set {
            // Update private variable
            
            _scrollDirection = newValue
            
            
            // Update content view
            
            setContentView(contentView: _contentView, forScrollDirection: newValue)
        }
    }
    
    // MARK: Public object methods
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update internal scroll view
        
        internalScrollView.frame = bounds
        
        let contentSizeForInternalScrollView = obtain(contentSizeForContentView: contentView, andScrollDirection: scrollDirection)
        
        if contentSizeForInternalScrollView != lastContentSize {
            internalScrollView.contentSize = contentSizeForInternalScrollView
            lastContentSize = contentSizeForInternalScrollView
        }
    }
    
    public func setContentView<ContentView: UIView>(ofType contentViewType: ContentView.Type, fromNib nibQuery: NibQuery, locatedInBundle bundleQuery: BundleQuery, withScrollDirection scrollDirection: ScrollDirection, configure configureContentView: ((_ contentView: ContentView) -> Void)?) {
        // Create new content view
        
        let viewInitializer = ViewInitializer(viewClass: ContentView.self)
        let newContentView = viewInitializer.view(fromNib: nibQuery, locatedInBundle: bundleQuery)
        
        // Update scroll direction
        
        _scrollDirection = scrollDirection
        
        // Update current content view
        
        contentView = newContentView
        
        // Configure new content view if needed
        
        configureContentView?(newContentView)
    }
    
    // MARK: Private object methods
    
    fileprivate func customInitialization() {
        // Initialize view
        
        backgroundColor = .clear
        
        // Initialize internal scroll view
        
        _internalScrollView = UIScrollView(frame: bounds)
        internalScrollView.backgroundColor = .clear
        
        let contentSizeForInternalScrollView: CGSize = .zero
        lastContentSize = contentSizeForInternalScrollView
        internalScrollView.contentSize = contentSizeForInternalScrollView
        
        addSubview(internalScrollView)
        
        // Initialize scroll direction
        
        _scrollDirection = ScrollableContainerView.defaultScrollDirection()
        
        // Update view
        
        setNeedsLayout()
    }
    
    fileprivate func obtain(frameForContentView contentView: UIView?, andScrollDirection scrollDirection: ScrollDirection) -> CGRect {
        if contentView == nil {
            return .zero
        } else {
            // Obtain frame for content view
            
            var frameForContentView: CGRect?
            
            switch scrollDirection {
            case .horizontal:
                frameForContentView = CGRect(x: 0.0, y: 0.0, width: contentView!.bounds.size.width, height: internalScrollView.bounds.size.height)
                break
            case .vertical:
                frameForContentView = CGRect(x: 0.0, y: 0.0, width: internalScrollView.bounds.size.width, height: contentView!.bounds.size.height)
                break
            }
            
            return frameForContentView!
        }
    }
    
    fileprivate func obtain(contentSizeForContentView contentView: UIView?, andScrollDirection scrollDirection: ScrollDirection) -> CGSize {
        let frameForContentView = obtain(frameForContentView: contentView, andScrollDirection: scrollDirection)
        let requiredContentSize = frameForContentView.size
        return requiredContentSize
    }
    
    fileprivate func setContentView(contentView: UIView?, forScrollDirection scrollDirection: ScrollDirection) {
        // Remove previous content view if needed
        
        if _contentView != nil {
            _contentView!.removeFromSuperview()
        }
        
        // Update private variable
        
        _contentView = contentView
        
        // Update internal scroll view
        
        if contentView != nil {
            // Obtain frame for content view
            
            var frameForContentView: CGRect?
            
            switch scrollDirection {
            case .horizontal:
                frameForContentView = CGRect(x: 0.0, y: 0.0, width: contentView!.bounds.size.width, height: internalScrollView.bounds.size.height)
                break
            case .vertical:
                frameForContentView = CGRect(x: 0.0, y: 0.0, width: internalScrollView.bounds.size.width, height: contentView!.bounds.size.height)
                break
            }
            
            // Update content view
            
            contentView!.frame = frameForContentView!
            
            // Update container
            
            internalScrollView.addSubview(contentView!)
            
            // Update view
            
            setNeedsLayout()
        }
    }
    
    // MARK: Actions
    
    // MARK: Protocol methods
    
}

public extension ScrollableContainerView {
    
    public enum ScrollDirection {
        case horizontal
        case vertical
    }
    
}
