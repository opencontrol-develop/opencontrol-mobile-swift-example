iOS swift library for collect device information

Current version: v1.0.0

Looking for Objetive-C Version? Checkout: (https://github.com/opencontrol-develop/opencontrol-mobile-objectivec-example) 

## Requirements
* iOS SDK 10.3+
* WebKit.framework
## Installation
* Download the latest released version (https://github.com/opencontrol-develop/opencontrol-mobile-swift-example/releases/download/1.0.0/SDK-V1.0.0.zip)
* Add opencontrol library
  * Go to **Build Phases -> Link Binary With Libraries** 
  * Click **Add items**
  * In the popup, click "Add Other..." option and select the file libOpencontrol.a
  * Validate the **Status** is required
  * Go to **Build Settings -> Search Paths-> Library Search Paths**
  * Click **Add items**
  * Put the route to the folder where is the file **libOpencontrol.a**
  * Go to **Build Settings -> Swift Compiler - Search Paths-> Import Paths**
  * Put the route to the folder where is the file **libOpencontrol.a**
* Add webkit framework
  * Go to **Build Phases -> Link Binary With Libraries** 
  * Click "Add items"
  * Search for "WebKit.framework", select it and click "Add"
## Usage
```Swift
import Opencontrol
```
### Create a instance object
For create an instance Opencontol needs:
* MerchantId
* Public API Key
* User Name
```Swift
private static let MERCHANT_ID = "merchantId"
private static let PUBLIC_KEY = "public key"
private static let USER_NAME = "username"
    
var opencontrol: Opencontrol!

func myFunction() {
	opencontrol = Opencontrol(withMerchantId: MERCHANT_ID, andPublicKey: PUBLIC_KEY, isProductionMode: false, isDebug: false, userName: USER_NAME)
}
```
### Production Mode
Use isProductionMode = true
```Swift
private static let MERCHANT_ID = "merchantId"
private static let PUBLIC_KEY = "public key"
private static let USER_NAME = "username"
    
var opencontrol: Opencontrol!

func myFunction() {
	opencontrol = Opencontrol(withMerchantId: MERCHANT_ID, andPublicKey: PUBLIC_KEY, isProductionMode: true, isDebug: false, userName: USER_NAME)
}
```
### Create a SessionID
The framework contains a function for generate a device sessionID. The following parameters are required: -Function to call when SessionID is generated -Function to call when error occurs
```Swift
var opencontrol: Opencontrol!

func myFunction() {
  opencontrol = Opencontrol(withMerchantId: MERCHANT_ID, andPublicKey: PUBLIC_KEY, isProductionMode: false, isDebug: false, userName: USER_NAME)
  opencontrol.createDeviceSessionId(successFunction: successSessionID, failureFunction: failSessionID)
}
func successSessionID(sessionID: String) {
  print("SessionID: \(sessionID)")
}

 func failSessionID(error: NSError) {
     print("\(error.code) - \(error.localizedDescription)")
 }
```
