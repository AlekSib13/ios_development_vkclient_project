//
//  MainPageViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 30.06.2021.
//

//import UIKit
//import RealmSwift
//import Firebase

/*
class MainPageViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        ManagerSingleton.shared.downloadDataViaAPI()
        checkForUserEmail()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        enterFireBase()
    }
}



extension MainPageViewController{
    func checkForUserEmail() -> () {
        if let user_email = UserDefaults.standard.object(forKey: "user_email") as? String, UserDefaults.standard.bool(forKey: "new_user") == false {
            
            
            return}
        else {
            let alertEmailInsertion = UIAlertController(title: "Email required", message: "The last step: please, enter your email or accessability of the data is not guaranteed.", preferredStyle: .alert)
            alertEmailInsertion.addTextField{emailTextField in emailTextField.placeholder = "email"}
            
            let insertionButton = UIAlertAction(title: "Done", style: .default){_ in
                if let email = alertEmailInsertion.textFields![0].text, email.contains("@") {
                    UserDefaults.standard.set(email, forKey: "user_email")
                    UserDefaults.standard.set(false, forKey: "new_user")
                } else {
                    let alertEmailIsNotSupported = UIAlertController(title: "Email is not suppoerted", message: "Try once again?", preferredStyle: .actionSheet)
                    
                    let emailNewAttempt = UIAlertAction(title: "Retry", style: .default){[weak self] _ in
                        self?.checkForUserEmail()}
                    
                    alertEmailIsNotSupported.addAction(emailNewAttempt)
                    self.present(alertEmailIsNotSupported, animated: true, completion: nil)
                }
                
            }
            alertEmailInsertion.addAction(insertionButton)
            self.present(alertEmailInsertion, animated: true, completion: {print("completed")})
        }
    }
}


extension MainPageViewController {
    func enterFireBase(){
        //fails with nil if open for the first time, because does not find email - repair.
        Auth.auth().signIn(withEmail: UserDefaults.standard.string(forKey: "user_email")!, password: UserDefaults.standard.string(forKey: "user_id")!){loginResult, loginError in
            if loginError != nil {
                Auth.auth().createUser(withEmail: UserDefaults.standard.string(forKey: "user_email")!, password: UserDefaults.standard.string(forKey: "user_id")!){
                    userCreationResult, userCreationError in
                    if userCreationError != nil {print(userCreationError?.localizedDescription ?? "User can't be created")} else {self.enterFireBase()}
                }
            }
            else {print("Success: \(loginResult)")
            }
        }
    }
}


*/
