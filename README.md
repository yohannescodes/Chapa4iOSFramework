
![chapalogo](https://github.com/yohanneskemer/Chapa4iOS/assets/99908888/b84c770e-5dfa-411b-b2a6-33a29fcb5af9)

# Chapa4iOS (Unofficial)
##### An iOS SDK for projects with Swift Programming Language
###### Accessible over Swift Package Manager

Inspired by the works of [YohannesTz](https://github.com/YohannesTz/ChapaKt) and [Chapi](https://github.com/Chapa-Et/chapa-django), Chapa4iOS is the **unofficial** iOS SDK for Chapa. 
This is done according to [the official documentation](https://developer.chapa.co) provided by the internal team of [Chapa](https://chapa.co).

### Features
- Generate Transaction Reference (Util)
- Accept Payment
- Verify Payment

### Remark
We have dealt with the *snake_case* variable names of JSON by mapping them into *camelCase* representations to make the models prepared comforming to Codable protocol.

## Installation
Chapa4iOS can be installed with the Swift Package Manager (SPM):
(https://github.com/yohannescodes/Chapa4iOS/)

## Getting Started
Once the installation process is done, we can import the SDK in the file we want to use it in.

### Configuration

```swift
import Chapa4iOS

var chapa: Chapa!

override func viewDidLoad(){
  chapa = Chapa(secretKey: "**YOUR SECRET KEY FROM CHAPA DASHBOARD**")
}
```


## Generate Transaction Reference
This utility method of Chapa instance allows you to generating a customizable random alpha numberic transaction reference.


```swift 
let transactionReference = chapa.generateTransactionReference()
```


## Accept Payment
Here we can initialize transaction by providing customer information and requesting for a checkout URL to load for our users.


```swift
let customer = Customer(amount: "100", currency: .etb, email: nil, firstName: "Yohannes", lastName: "Haile", phoneNumber: "0922106876", txRef: transactionReference, callbackURL: nil, returnURL: nil, customization: nil)

//Enter the instance of your View Controller when you call the following method so it can instantiate Web View for the Checkout page it retrieves from the response.
chapa.acceptPayment(controller: self, customer: customer)
```  

### Data Types of Optional Properties:

- email: String?
- firstName: String?
- lastName: String?
- phoneNumber: String?
- callbackURL: String?
- returnURL: String? (HIGHLY RECOMMENDED TO PROVIDE THIS FIELD)
- customization: ChapaCustomization?

### What can you customize?

You can customize the checkout page for your users by providing:
- title
- description

## Verify Payment
Verifying transactions is automated starting from Chapa4iOS v1.0.0.

### Thank you for working with Chapa4iOS 🧡

## Remark: The XCFramework project in this repository will be included in the Swift package's Souce folder soon.

