//
//  ViewController.swift
//  CusineAppUI
//
//  Created by Enes Kaya on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {

    let myLabel = UILabel()
    let textField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        let width = view.frame.size.width
        let height = view.frame.size.height
        
       
        myLabel.text = "MyLabel text test"
        myLabel.textAlignment = .center
        myLabel.textColor = .green
        myLabel.frame = CGRect(x: width/2 - ((width * 0.6)/2), y: height/2, width: width * 0.6, height: 50)
        
        view.addSubview(myLabel)
        
        
        let myButton = UIButton()
        myButton.setTitle("Click me",for: .normal)
        myButton.setTitleColor(.green, for: UIControl.State.normal)
        myButton.frame = CGRect(x: 100, y: 200, width: width/2, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action:#selector(ViewController.myButtonTapped), for: .touchUpInside)
        
    
        textField.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        textField.textColor = .black
        textField.font = .boldSystemFont(ofSize: 12)
        textField.placeholder = "Bana yaz"
        view.addSubview(textField)
        
        
        
        
    }
    
    @objc func myButtonTapped() {
        print("Button Tıklandı")
        myLabel.text = textField.text
    }
    

   
  
    
}

