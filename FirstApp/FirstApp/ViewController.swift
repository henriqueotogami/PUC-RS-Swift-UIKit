//
//  ViewController.swift
//  FirstApp
//
//  Created by Henrique Matheus Alves Pereira on 25/06/21.
//

import UIKit
import Firebase




class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    class LoginViewController: UIViewController {
        
        @IBOutlet weak var emailTextField: UITextField!
        @IBOutlet weak var passwordTextField: UITextField!
        
        var auth:Auth?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            self.auth = Auth.auth()
        }
        
        func alert(title: String, message: String) {
            
            let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let ok: UIAlertAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alertController.addAction(ok)
            self.present(alertController, animated: true, completion: nil)
        }
        
        @IBAction func tappedLoginButton(_ sender: UIButton) {
            
            let email:String = self.emailTextField.text ?? ""
            let senha:String = self.passwordTextField.text ?? ""
            
            self.auth?.signIn(withEmail: email, password: senha, completion: { (usuario, error) in
                
                if error != nil {
                    self.alert(title: "Atenção", message: "Dados incorretos, tente novamente.")
                    //print("Dados incorretos, tente novamente.")
                }else{
                    if usuario == nil {
                        self.alert(title: "Atenção", message: "Tivemos um problema inesperado.")
                        //print("Tivemos um problema inesperado.")
                    }else{
                        self.alert(title: "Atenção", message: "Login realizado com sucesso.")
                        //print("Login realizado com sucesso.")
                    }
                }
            })
        }
        
        @IBAction func tappedRegisterButton(_ sender: UIButton){
            self.performSegue(withIdentifier: "RegisterViewController", sender: nil)
        }
        
    }

    class RegisterViewController: UIViewController {
        
        @IBOutlet weak var emailTextField: UITextField!
        @IBOutlet weak var passwordTextField: UITextField!
        
        var auth:Auth?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            self.auth = Auth.auth()
        }
        
        func alert(title: String, message: String) {
            
            let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let ok: UIAlertAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alertController.addAction(ok)
            self.present(alertController, animated: true, completion: nil)
        }
        
        @IBAction func tappedRegisterButton(_ sender: UIButton) {
            
            let email:String = self.emailTextField.text ?? ""
            let senha:String = self.passwordTextField.text ?? ""
            
            self.auth?.createUser(withEmail: email, password: senha, completion: { (result, error) in
                
                if error != nil {
                    self.alert(title: "Atenção", message: "Falha ao cadastrar.")
                    // print("Falha ao cadastrar.")
                }else{
                    self.alert(title: "Parabéns", message: "Sucesso ao cadastrar.")
                    // print("Sucesso ao cadastrar")
                }
            })
        }
    }

}


