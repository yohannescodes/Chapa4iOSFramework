//
//  Chapa.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import Foundation
import UIKit

public class Chapa{
    
    public var publicKey: String
    public var secretKey: String
    public var amount: Double
    public var currency: ChapaCurrency
    public var txnRef: String
    
    public init(publicKey: String, secretKey: String, amount: Double, currency: ChapaCurrency, txnRef: String) {
        self.publicKey = publicKey
        self.secretKey = secretKey
        self.amount = amount
        self.currency = currency
        self.txnRef = txnRef
    }
    
    public func acceptPayment(controller: UIViewController){
        Task.init {
            do{
                let response = try await ChapaNetworkManager().acceptPayment(customer: Customer(amount: self.amount, currency: self.currency, txRef: self.txnRef), key: self.secretKey)
                
                DispatchQueue.main.async{
                    let checkoutVC = CheckoutViewController()
                    checkoutVC.url = response.data.checkoutURL
                    controller.modalPresentationStyle = .fullScreen
                    controller.present(checkoutVC, animated: true)
                }
            }catch(let error){
                DispatchQueue.main.async{
                    let alert = UIAlertController(title: "Whoops 😬", message: error.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "Ok", style: .cancel)
                    alert.addAction(alertAction)
                    controller.present(alert, animated: true)
                }
            }
        }
    }
    
    public func verifyPayment(controller: UIViewController){
        Task.init {
            do{
                let response = try await ChapaNetworkManager().verifyPayment(transactionRefference: self.txnRef, key: self.secretKey)
                DispatchQueue.main.async{
                    let alert = UIAlertController(title: "Congrats 🎉", message: response.message, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "Ok", style: .cancel)
                    alert.addAction(alertAction)
                    controller.present(alert, animated: true)
                }
            }catch(let error){
                DispatchQueue.main.async{
                    let alert = UIAlertController(title: "Whoops 😬", message: error.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "Ok", style: .cancel)
                    alert.addAction(alertAction)
                    controller.present(alert, animated: true)
                }
            }
        }
    }
    
}
