//
//  UIViewControllerExtension.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import UIKit
import SVProgressHUD

public typealias VCCompletion = ()->Void

extension UIViewController {
    
    @objc public func showAlertMessage(message:String, completion: @escaping VCCompletion){
        
        let ac = UIAlertController(title: message, message: "", preferredStyle: .alert)
        
        present(ac, animated: true, completion: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.dismiss(animated: true, completion: nil)
                completion()
            }
        })
    }
    
    @objc  public func showAlertMessage(title: String, message:String, completion: @escaping VCCompletion){
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        present(ac, animated: true, completion: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.dismiss(animated: true, completion: nil)
                completion()
            }
        })
    }
    
    func showOkAlertMessageWithText(message: String, completion: @escaping VCCompletion){
        let ac = UIAlertController(title: message, message: "", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (AlertAction) in
            self.dismiss(animated: true, completion: nil)
            DispatchQueue.main.async {
                completion()
            }
        }))
        present(ac, animated: true, completion: nil)
    }
    
    @objc  public func showAlertMessage(message:String, acceptCompletion: @escaping VCCompletion, denyCompletion: VCCompletion? = nil){
        
        let ac = UIAlertController(title: message, message: "",  preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (AlertAction) in
            acceptCompletion()
        }))
        
        ac.addAction(UIAlertAction(title: "No", style: .default, handler: { (AlertAction) in
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
                if denyCompletion != nil {
                    denyCompletion!()
                }
            }
        }))
        
        present(ac, animated: true, completion: nil)
    }
    
    func showAlertMessage(message:String, acceptCompletion: @escaping VCCompletion, denyCompletion: @escaping VCCompletion){
        
        let ac = UIAlertController(title: message, message: "",  preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (AlertAction) in
            acceptCompletion()
        }))
        
        ac.addAction(UIAlertAction(title: "No", style: .default, handler: { (AlertAction) in
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
                denyCompletion()
            }
        }))
        
        present(ac, animated: true, completion: nil)
    }
    
    
    func showError(error: String){
        self.showAlertMessage(message: error, completion: {})
    }
    
    func showError(title: String, message: String){
        self.showAlertMessage(title: title, message: message, completion:{})
    }
    
    func showAlertWith(message: String, acceptCompletion:@escaping VCCompletion, denyCompletion: @escaping VCCompletion){
        self.showAlertMessage(message: message, acceptCompletion: acceptCompletion, denyCompletion: denyCompletion)
    }
    
    
    func showSuccessWith(message: String){
        DispatchQueue.main.async {
            SVProgressHUD.showSuccess(withStatus: message)
        }
    }
    
    func showErrorWith(message: String){
        DispatchQueue.main.async {
            SVProgressHUD.showError(withStatus: message)
        }
    }
    
    
    func showHud(){
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    func hideHud(){
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}

extension NSObject {
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
}
