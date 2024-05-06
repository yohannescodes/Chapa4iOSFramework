//
//  Chapa.swift
//  Chapa4iOS
//
//  Created by Yohannes Haile on 5/4/24.
//

import Foundation
import UIKit

public class Chapa{
    
    public var secretKey: String

    
    public init(secretKey: String) {
        self.secretKey = secretKey
    }
    
    
    public func generateTransactionReference() -> String{
        return "TX" + String.random()
    }
    
    public func acceptPayment(controller: UIViewController, customer: Customer){
        Task.init {
            do{
                
                
                let response = try await ChapaNetworkManager().acceptPayment(customer: customer, key: self.secretKey)
                
                DispatchQueue.main.async{
                    let checkoutVC = CheckoutViewController()
                    checkoutVC.url = response.data.checkoutURL
                    checkoutVC.returnURL = customer.returnURL ?? ChapaConstants.defaultReturnURL
                    checkoutVC.transactionRefference = customer.txRef
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
    
    public func verifyPayment(controller: UIViewController, txRef: String){
        Task.init {
            do{
                let response = try await ChapaNetworkManager().verifyPayment(transactionRefference: txRef, key: self.secretKey)
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
