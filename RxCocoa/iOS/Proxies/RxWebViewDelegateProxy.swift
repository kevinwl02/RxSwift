//
//  RxWebViewDelegateProxy.swift
//  RxCocoa
//
//  Created by Andrew Breckenridge on 9/26/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

#if os(iOS)

import UIKit
import WebKit
import RxSwift

extension WKWebView: HasDelegate {
    public var delegate: WKNavigationDelegate? {
        get { return navigationDelegate }
        set { navigationDelegate = newValue }
    }

    public typealias Delegate = WKNavigationDelegate
}

open class RxWebViewDelegateProxy
    : DelegateProxy<WKWebView, WKNavigationDelegate>
    , DelegateProxyType 
    , WKNavigationDelegate {

    /// Typed parent object.
    public weak private(set) var webView: WKWebView?

    /// - parameter webView: Parent object for delegate proxy.
    public init(webView: ParentObject) {
        self.webView = webView
        super.init(parentObject: webView, delegateProxy: RxWebViewDelegateProxy.self)
    }

    // Register known implementations
    public static func registerKnownImplementations() {
        self.register { RxWebViewDelegateProxy(webView: $0) }
    }
}

#endif
