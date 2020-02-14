//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by FGT MAC on 2/14/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var toggleButtonPressed: UIBarButtonItem!
    
    var isScattered = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
    }
    
    
    //Create nav Button
    func setupButton(){
        toggleButtonPressed = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(navButtonPressed))
        self.navigationItem.rightBarButtonItem = toggleButtonPressed
    }
    
    //Func to toggle Bool
    @objc func navButtonPressed() {
        isScattered = !isScattered
        print(isScattered)
    }
    


}

