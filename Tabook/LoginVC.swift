//
//  LoginVC.swift
//  Tabook
//
//  Created by mac on 01/11/18.
//  Copyright © 2018 Tabook Alim's Inc. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //    UI Object
    @IBOutlet weak var textFieldsView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var leftLineView: UIView!
    @IBOutlet weak var rightLineView: UIView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var handsImageVIew: UIImageView!
    
    // constraint object
    @IBOutlet weak var coverImageView_top: NSLayoutConstraint!
    @IBOutlet weak var whiteIconImageView_y: NSLayoutConstraint!
    @IBOutlet weak var handImageView_top: NSLayoutConstraint!
    @IBOutlet weak var registerButton_bottom: NSLayoutConstraint!
    
    //    First load function
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector:  #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector:  #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    
    //to hide keyboard after touch anything on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //this function for hide keyboard
        self.view.endEditing(false)
    }
    
    @objc func keyboardWillShow(notification: Notification){
        
        //minus 75px image view constraint
        coverImageView_top.constant -= 85
        handImageView_top.constant -= 85
        whiteIconImageView_y.constant += 50
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            registerButton_bottom.constant += keyboardSize.height
            
        }
        
        UIView.animate(withDuration: 0.5) {
            self.handsImageVIew.alpha = 0
            
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: Notification){
        
        //add 75px image view constraint
        coverImageView_top.constant += 85
        handImageView_top.constant += 85
        whiteIconImageView_y.constant -= 50
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            registerButton_bottom.constant -= keyboardSize.height
            
        }
        
        UIView.animate(withDuration: 0.5) {
            self.handsImageVIew.alpha = 1
            
            //force the view editing
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configure_textFieldsView()
        configure_loginBtn()
        configure_orLabel()
        configure_registerBtn()
    }
    
    // for configure textfield's view
    func configure_textFieldsView (){
        
        // declare constant for width and color of border
        let width = CGFloat(2)
        let color = UIColor.groupTableViewBackground.cgColor
        
        //configure of textfieldview's border
        let border  = CALayer()
        border.borderWidth = width
        border.borderColor = color
        border.frame = CGRect(x: 0, y: 0, width: textFieldsView.frame.width, height: textFieldsView.frame.height)
        
        //configure for center of line
        let line = CALayer()
        line.borderWidth = width
        line.borderColor = color
        line.frame = CGRect(x: 0, y: textFieldsView.frame.height / 2 - width, width: textFieldsView.frame.width, height: width)
        
        // apply configure for border and line border
        textFieldsView.layer.addSublayer(border)
        textFieldsView.layer.addSublayer(line)
        
        // add corner radius on textfield
        textFieldsView.layer.cornerRadius = 5
        textFieldsView.layer.masksToBounds = true
        
        
    }
    
    func configure_loginBtn(){
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        loginButton.isEnabled = false
    }
    
    func configure_orLabel(){
        
        //declare constant
        let width = CGFloat(2)
        let color = UIColor.groupTableViewBackground.cgColor
        
        //create leftLine OR object
        let leftLine = CALayer()
        leftLine.borderWidth = width
        leftLine.borderColor = color
        leftLine.frame = CGRect(x: 0, y: leftLineView.frame.height / 2 - width, width: leftLineView.frame.width, height: width)
        
        //create righLine OR object
        let rightLine  = CALayer()
        rightLine.borderWidth = width
        rightLine.borderColor = color
        rightLine.frame = CGRect(x: 0, y: rightLineView.frame.height / 2 - width, width: rightLineView.frame.width, height: width)
        
        //apply the configure line OR
        leftLineView.layer.addSublayer(leftLine)
        rightLineView.layer.addSublayer(rightLine)
    }
    
    func configure_registerBtn(){
        
        //creating border on register button
        let border  = CALayer()
        border.borderColor = UIColor(red: 68/255, green: 105/255, blue: 176/255, alpha: 1).cgColor
        border.borderWidth = 2
        border.frame = CGRect(x: 0, y: 0, width: registerButton.frame.width, height: registerButton.frame.height)
        
        //apply the border regiter button
        registerButton.layer.addSublayer(border)
        
        
        //make it round
        registerButton.layer.cornerRadius = 5
        registerButton.layer.masksToBounds = true
        
    }
    

}
