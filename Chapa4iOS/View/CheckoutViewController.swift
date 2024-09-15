//
//  CheckoutViewController.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import UIKit
import WebKit

protocol CheckoutViewControllerDelegate {
    func verifyPayment(txRef: String)
}

public class CheckoutViewController: UIViewController {

    var webView: WKWebView!
    public var url = ""
    public var returnURL: String?
    public var transactionRefference: String?
    var delegate: CheckoutViewControllerDelegate?
    
    public override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: url){
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }else{
            let alert = UIAlertController(title: "Whoops 😬", message: "Couldn't load the checkout page!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .cancel)
            
            alert.addAction(alertAction)
            self.present(alert, animated: true)
        }
    }

}

extension CheckoutViewController: WKNavigationDelegate{
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.url!.absoluteString.range(of: returnURL ?? ChapaConstants.defaultReturnURL) != nil{
            
            self.dismiss(animated: true)
            }
        }
    
    // See if the checkout URL is changed and verify the transaction.
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.request.url != nil {
            if let transactionRefference {
                delegate?.verifyPayment(txRef: transactionRefference)
            }
        }
        decisionHandler(.allow)
    }
}

