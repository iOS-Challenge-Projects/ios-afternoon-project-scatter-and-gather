//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by FGT MAC on 2/14/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 
    var imageView: UIImageView!
    
    var isScattered = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        setupLabels()
        setupImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        imageView.center = self.view.center
    }
    
    
    //MARK: - Setup button
    
    //Create nav Button
    func setupButton(){
       let toggleButtonPressed = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(navButtonPressed))
        self.navigationItem.rightBarButtonItem = toggleButtonPressed
    }
    
    //Func to toggle Bool
    @objc func navButtonPressed() {
        isScattered = !isScattered
        print(isScattered)
    }
    
    
    //MARK: - Setup Labels
    
    func setupLabels() {
        
        //1 label
        let firstLabel = UILabel()
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.text = "L"
        firstLabel.textAlignment = .center
        firstLabel.font = UIFont.systemFont(ofSize: 60)

        //2 label
        let secondLabel = UILabel()
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = "A"
        secondLabel.textAlignment = .center
        secondLabel.font = UIFont.systemFont(ofSize: 60)
        
        //3 label
        let thirdLabel = UILabel()
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.text = "M"
        thirdLabel.textAlignment = .center
        thirdLabel.font = UIFont.systemFont(ofSize: 60)
        
        //4 label
        let forthLabel = UILabel()
        forthLabel.translatesAutoresizingMaskIntoConstraints = false
        forthLabel.text = "B"
        forthLabel.textAlignment = .center
        forthLabel.font = UIFont.systemFont(ofSize: 60)
        
        //5 label
        let fifthLabel = UILabel()
        fifthLabel.translatesAutoresizingMaskIntoConstraints = false
        fifthLabel.text = "D"
        fifthLabel.textAlignment = .center
        fifthLabel.font = UIFont.systemFont(ofSize: 60)
        
        //6 label
        let sixthLabel = UILabel()
        sixthLabel.translatesAutoresizingMaskIntoConstraints = false
        sixthLabel.text = "A"
        sixthLabel.textAlignment = .center
        sixthLabel.font = UIFont.systemFont(ofSize: 60)

        
        //Create a stack view
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        //position
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        //Put items inside
        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(secondLabel)
        stackView.addArrangedSubview(thirdLabel)
        stackView.addArrangedSubview(forthLabel)
        stackView.addArrangedSubview(fifthLabel)
        stackView.addArrangedSubview(sixthLabel)
        
        //constraint stackView
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60).isActive = true
        
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        
    }
    
    func setupImage() {
        
        //Initiate image
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "lambda_logo")
        
        //Constraints
        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        //add to the view
        view.addSubview(imageView)
        
    }


}

