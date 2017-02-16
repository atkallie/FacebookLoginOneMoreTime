//
//  SignInVC.swift
//  FacebookLoginOneMoreTime
//
//  Created by Ahmed T Khalil on 2/15/17.
//  Copyright © 2017 kalikans. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth

class SignInVC: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet var signInBtn: FancyButton!
    @IBOutlet var FBBtnView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginBtn = FBSDKLoginButton()
        loginBtn.delegate = self
        //this modifies the permissions requested to be read from the user's FB account
        loginBtn.readPermissions = ["public_profile","email","user_friends"]
        //there are also publish permissions
        //loginBtn.publishPermissions
        
        FBBtnView.addSubview(loginBtn)
        let widthBtn = UIScreen.main.bounds.width - 40.0
        loginBtn.frame = CGRect(x: 0.0, y: 0.0, width: widthBtn, height: FBBtnView.bounds.height)
    }
    
    public func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!){
        
        if let error = error {
            print(error.localizedDescription)
        }
        
        if result.token != nil {
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                if user != nil {
                    print("Successfully signed into Firebase!")
                    
                    //Represents a request to the Facebook Graph API using the current access token
                    //should be used in conjunction with FBSDKGraphRequestConnection to issue request (here we use start for single request)
                    //Note the similarity to datatask because this IS a datatask in disguise (returned 'results' below is a JSON dictionary)
                    
                    //List of all possible parameters: https://developers.facebook.com/docs/graph-api/reference/user
                    
                    FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, name, email, friends"]).start(completionHandler: { (connection, result, error) in
                        if error != nil{
                            print("Failed to start graph request \(error)")
                            return
                        }
                        
                        let data:[String:AnyObject] = result as! [String : AnyObject]
                        print(data)
                        print(data["name"]!)
                    })
                    
                }
            })
        }
    }
    
    public func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!){
        do {
            try FIRAuth.auth()?.signOut()
            print("Successfully signed out of Firebase!")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }

    
 
    
}

