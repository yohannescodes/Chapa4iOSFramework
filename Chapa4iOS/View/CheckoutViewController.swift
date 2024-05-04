//
//  CheckoutViewController.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import UIKit
import WebKit

class CheckoutViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var url = ""
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
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
