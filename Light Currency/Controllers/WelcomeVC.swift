//
//  WelcomeVC.swift
//  Light Currency
//
//  Created by Uladzislau Daratsiuk on 7/9/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    lazy var logoImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var wavesImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "waves")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = "Light Converter"
        return label
    }()
    
    lazy var getStartButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get start", for: .normal)
        button.setTitleColor(UIColor(named: "background"), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.addTarget(self, action: #selector(handlePresent), for: .touchUpInside)
        return button
    }()

    fileprivate func setupNavBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    fileprivate func setupView(){
        logoImage.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80).isActive = true
        logoImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: 1).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        wavesImage.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100).isActive = true
        wavesImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wavesImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        wavesImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        wavesImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteView.topAnchor.constraint(equalTo: wavesImage.bottomAnchor, constant: -10).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        whiteView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        whiteView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        whiteView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        getStartButton.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor).isActive = true
        getStartButton.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        getStartButton.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 20).isActive = true
        getStartButton.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -20).isActive = true
        getStartButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoImage)
        view.addSubview(wavesImage)
        view.addSubview(whiteView)
        view.addSubview(titleLabel)
        view.addSubview(getStartButton)
        setupNavBar()
        setupView()
        view.backgroundColor =  UIColor(named: "background")
    }


}
