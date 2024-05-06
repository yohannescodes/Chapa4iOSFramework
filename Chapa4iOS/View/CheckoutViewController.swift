//
//  CheckoutViewController.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import UIKit
import WebKit

public class CheckoutViewController: UIViewController {

    var webView: WKWebView!
    public var url = ""
    public var returnURL: String?
    public var transactionRefference: String?
    
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
}
