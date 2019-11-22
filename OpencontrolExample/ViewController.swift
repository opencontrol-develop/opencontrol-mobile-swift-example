//
//  ViewController.swift
//  OpencontrolExample
//
//  Created by Jonatan Mendoza on 11/22/19.
//  Copyright © 2019 Openpay. All rights reserved.
//

import UIKit
import Opencontrol
class ViewController: UIViewController {
    var opencontrol: Opencontrol!
    private static let USER_NAME = "<put your username>"
    private static let MERCHANT_ID = "<put your merchant id>"
    private static let PUBLIC_KEY = "<put your public key>"
    private static let IS_PRODUCTION_MODE = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMessage(sender: UIButton) {
         opencontrol = Opencontrol(withMerchantId: ViewController.MERCHANT_ID, andPublicKey: ViewController.PUBLIC_KEY, isProductionMode: ViewController.IS_PRODUCTION_MODE, isDebug: false, userName: ViewController.USER_NAME)
         opencontrol.createDeviceSessionId(successFunction: successSessionID, failureFunction: failSessionID)
       }
    func successSessionID(sessionID: String) {
     let alertController = UIAlertController(title: "Opencontrol Session ID", message: sessionID, preferredStyle: UIAlertController.Style.alert)
     alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
     present(alertController, animated: true, completion: nil)
    }
     
     func failSessionID(error: NSError) {
         print("Fail SessionID...")
         print("\(error.code) - \(error.localizedDescription)")
     }
}

