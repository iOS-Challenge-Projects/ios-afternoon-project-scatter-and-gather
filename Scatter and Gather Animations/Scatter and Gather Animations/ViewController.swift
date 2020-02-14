//
//  ViewController.swift
//  Scatter and Gather Animations
//
//  Created by FGT MAC on 2/14/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstLabel: UILabel!
    var secondLabel: UILabel!
    var thirdLabel: UILabel!
    var forthLabel: UILabel!
    var fifthLabel: UILabel!
    var sixthLabel: UILabel!
    
    var imageView: UIImageView!
    
    var isScattered = false
    
    var positionL: CGPoint?
    var positionA: CGPoint?
    var positionM: CGPoint?
    var positionB: CGPoint?
    var positionD: CGPoint?
    var positionAs: CGPoint?

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
    
    
    //MARK: - Setup Labels
    
    func setupLabels() {
        
        //1 label
        firstLabel = UILabel()
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.text = "L"
        firstLabel.textAlignment = .center
        firstLabel.font = UIFont.systemFont(ofSize: 60)

        //2 label
        secondLabel = UILabel()
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = "A"
        secondLabel.textAlignment = .center
        secondLabel.font = UIFont.systemFont(ofSize: 60)
        
        //3 label
        thirdLabel = UILabel()
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.text = "M"
        thirdLabel.textAlignment = .center
        thirdLabel.font = UIFont.systemFont(ofSize: 60)
        
        //4 label
        forthLabel = UILabel()
        forthLabel.translatesAutoresizingMaskIntoConstraints = false
        forthLabel.text = "B"
        forthLabel.textAlignment = .center
        forthLabel.font = UIFont.systemFont(ofSize: 60)
        
        //5 label
        fifthLabel = UILabel()
        fifthLabel.translatesAutoresizingMaskIntoConstraints = false
        fifthLabel.text = "D"
        fifthLabel.textAlignment = .center
        fifthLabel.font = UIFont.systemFont(ofSize: 60)
        
        //6 label
        sixthLabel = UILabel()
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
    
    
    //MARK: - Animation
    
    func generateRandomColor() -> CGColor {
    let redValue = CGFloat(drand48())
    let greenValue = CGFloat(drand48())
    let blueValue = CGFloat(drand48())
          
        let randomColor = CGColor(srgbRed: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
       
    return randomColor
    }
    
    
    //Func to toggle Bool
    @objc func navButtonPressed() {
        
        //Toggle bool
        isScattered = !isScattered
        
        //animate base on bool
        if isScattered{
            scatter()
        }else{
            gather()
        }
    }
    
    
    func scatter() {
        
        let animationBlock = {
            
            //Fade and rotate letters
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5){
                //fade img
                self.imageView.alpha = 0.0
                
                self.firstLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...360))
                self.secondLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...360))
                self.thirdLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...360))
                self.forthLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...360))
                self.fifthLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...360))
                self.sixthLabel.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...360))
                
            }
            
            //background color
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0){
        
                
                self.firstLabel.layer.backgroundColor = self.generateRandomColor()
                self.secondLabel.layer.backgroundColor = self.generateRandomColor()
                self.thirdLabel.layer.backgroundColor = self.generateRandomColor()
                self.forthLabel.layer.backgroundColor = self.generateRandomColor()
                self.fifthLabel.layer.backgroundColor = self.generateRandomColor()
                self.sixthLabel.layer.backgroundColor = self.generateRandomColor()
                
            }
            
            //Move letters to another location
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5){
                
                self.positionL = self.firstLabel.center
                self.positionA = self.secondLabel.center
                self.positionM = self.thirdLabel.center
                self.positionB = self.forthLabel.center
                self.positionD = self.fifthLabel.center
                self.positionAs = self.sixthLabel.center
            
                
                self.firstLabel.center =  CGPoint(x: Int.random(in: -50...400), y: Int.random(in: -100...400))
                self.secondLabel.center = CGPoint(x: Int.random(in: -50...400), y: Int.random(in: -100...400))
                self.thirdLabel.center = CGPoint(x: Int.random(in: -50...400), y: Int.random(in: -100...400))
                self.forthLabel.center = CGPoint(x: Int.random(in: -50...400), y: Int.random(in: -100...400))
                self.fifthLabel.center = CGPoint(x: Int.random(in: -50...400), y: Int.random(in: -100...400))
                self.sixthLabel.center = CGPoint(x: Int.random(in: -50...400), y: Int.random(in: -100...400))
                
            }
        }
        
        
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: animationBlock, completion: nil)
    }
    
    
    
    func gather() {

        let animationBlock = {
            
            //Fade and rotate letters
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5){
                //fade img
                self.imageView.alpha = 1.0
                
                self.firstLabel.transform = .identity
                self.secondLabel.transform = .identity
                self.thirdLabel.transform = .identity
                self.forthLabel.transform = .identity
                self.fifthLabel.transform = .identity
                self.sixthLabel.transform = .identity
                
            }
            
            //background color
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0){
                
                
                self.firstLabel.layer.backgroundColor = UIColor.white.cgColor
                self.secondLabel.layer.backgroundColor = UIColor.white.cgColor
                self.thirdLabel.layer.backgroundColor = UIColor.white.cgColor
                self.forthLabel.layer.backgroundColor = UIColor.white.cgColor
                self.fifthLabel.layer.backgroundColor = UIColor.white.cgColor
                self.sixthLabel.layer.backgroundColor = UIColor.white.cgColor
                
            }
            
            //Move letters to another location
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5){
                
                self.firstLabel.center = self.positionL!
                self.secondLabel.center = self.positionA!
                self.thirdLabel.center = self.positionM!
                self.forthLabel.center = self.positionB!
                self.fifthLabel.center = self.positionD!
                self.sixthLabel.center = self.positionAs!
                
            }
        }
        
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: animationBlock, completion: nil)
    }


}

