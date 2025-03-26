
![chapalogo](https://github.com/yohanneskemer/Chapa4iOS/assets/99908888/b84c770e-5dfa-411b-b2a6-33a29fcb5af9)

# Chapa4iOS (Unofficial)
##### An iOS SDK for projects with the Swift Programming Language
###### Accessible over Swift Package Manager

Inspired by the works of [YohannesTz](https://github.com/YohannesTz/ChapaKt) and [Chapi](https://github.com/Chapa-Et/chapa-django), Chapa4iOS is the **unofficial** iOS SDK for Chapa. 
This is done according to [the official documentation](https://developer.chapa.co) provided by the internal team of [Chapa](https://chapa.co).

### Features
- Generate Transaction Reference (Util)
- Accept Payment
- Verify Payment

### Remark
We have dealt with the *snake_case* variable names of JSON by mapping them into *camelCase* representations to make the models conform to the Codable protocol.

## Installation
Chapa4iOS can be installed with the Swift Package Manager (SPM):
(https://github.com/yohannescodes/Chapa4iOS/)

## Getting Started
Once the installation process is done, we can import the SDK into the file where we want to use it.

### Configuration

```swift
import Chapa4iOS

var chapa: Chapa!

override func viewDidLoad(){
  chapa = Chapa(secretKey: "**YOUR SECRET KEY FROM CHAPA DASHBOARD**")
}
```


## Generate Transaction Reference
This utility method of the Chapa instance allows you to generate a customizable random alphanumeric transaction reference.


```swift 
let transactionReference = chapa.generateTransactionReference()
```


## Accept Payment
Here we can initialize a transaction by providing customer information and requesting for a checkout URL to load for our users.


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
Verify transactions are automated starting from Chapa4iOS v1.0.0.

## Thank you for working with Chapa4iOS 🧡

### Contribution Guide
If you are interested in working on the Chapa4iOS project, please check the project's board view to grab a ticket to work on.
[Chapa4iOS Project](https://www.notion.so/9d68c3804d334789bdf3b091d0211961?v=bf6dce98b94c4a89bfd6bcd986b78b56)

