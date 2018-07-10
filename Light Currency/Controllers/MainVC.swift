//
//  MainVC.swift
//  Light Currency
//
//  Created by Uladzislau Daratsiuk on 7/9/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    let currencyCellId = "currencyCellId"
    let selectCurrencyCellId = "selectCurrencyCellId"
    let urlString = "https://exchangeratesapi.io/api/latest?base="
    var selectedCurrency = "USD"
    var currenciesList: [Currency] = []
    var currentAmount: [Double] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var currencyMenuShowing = false
    var currencyMenuHeightAnchor: NSLayoutConstraint?
    
    
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
    
    lazy var exchangeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white.withAlphaComponent(0)
        return view
    }()
    
    lazy var exchangeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "exchange"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        return button
    }()
    
    lazy var seperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var mainCarrencyFlagImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "USD")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var mainCurrencyLabel: UILabel = {
        let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "USD"
        return label
    }()
    
    lazy var mainCurrecnySelectButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.white.withAlphaComponent(0.9)
        button.setImage(UIImage(named: "select"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(selectMainCurrency), for: .touchUpInside)
        return button
    }()
    
    lazy var mainInputTf: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .right
        tf.textColor = UIColor.white
        tf.font = UIFont.systemFont(ofSize: 23)
        tf.layer.borderWidth = 0
        tf.backgroundColor = UIColor.white.withAlphaComponent(0)
        tf.attributedPlaceholder = NSAttributedString(string: "Enter amount",attributes: [NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        tf.addTarget(self, action: #selector(handleMainInput), for: .allEvents)
        return tf
    }()
    
    lazy var secondCarrencyFlagImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "EUR")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var secondCurrencyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "EUR"
        return label
    }()
    
    lazy var secondCurrecnySelectButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.white.withAlphaComponent(0.9)
        button.setImage(UIImage(named: "select"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        return button
    }()
    
    lazy var secondInputTf: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .right
        tf.textColor = UIColor.white
        tf.font = UIFont.systemFont(ofSize: 23)
        tf.layer.borderWidth = 0
        tf.backgroundColor = UIColor.white.withAlphaComponent(0)
        tf.attributedPlaceholder = NSAttributedString(string: "Here will be result",attributes: [NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        return tf
    }()
    
    lazy var curenciesInfoCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 1, bottom: 10, right: 1)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CurrencyCell.self, forCellWithReuseIdentifier: currencyCellId)
        view.backgroundColor = UIColor.white
        view.isScrollEnabled = true
        return view
    }()
    
    lazy var currenciesListCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(SelectCurrencyCell.self, forCellWithReuseIdentifier: selectCurrencyCellId)
        view.backgroundColor = UIColor(named: "background")
        view.isScrollEnabled = true
        return view
    }()
    
    fileprivate func setupNavBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(handleMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: self, action: #selector(handleShare))
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.topItem?.title = "Converter"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
    fileprivate func setupView(){
        wavesImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        wavesImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wavesImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        wavesImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        wavesImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        whiteView.topAnchor.constraint(equalTo: wavesImage.bottomAnchor, constant: -10).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        whiteView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        whiteView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        whiteView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        exchangeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        exchangeView.bottomAnchor.constraint(equalTo: wavesImage.topAnchor).isActive = true
        exchangeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        exchangeView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        exchangeView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        exchangeButton.rightAnchor.constraint(equalTo: exchangeView.rightAnchor, constant: -20).isActive = true
        exchangeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        exchangeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        exchangeButton.centerYAnchor.constraint(equalTo: exchangeView.centerYAnchor).isActive = true
        
        seperatorView.centerYAnchor.constraint(equalTo: exchangeButton.centerYAnchor).isActive = true
        seperatorView.leftAnchor.constraint(equalTo: exchangeView.leftAnchor, constant: 20).isActive = true
        seperatorView.rightAnchor.constraint(equalTo: exchangeButton.leftAnchor, constant: -20).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        mainCarrencyFlagImage.leftAnchor.constraint(equalTo: exchangeView.leftAnchor, constant: 20).isActive = true
        mainCarrencyFlagImage.bottomAnchor.constraint(equalTo: seperatorView.topAnchor, constant: -55).isActive = true
        mainCarrencyFlagImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        mainCarrencyFlagImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        mainCurrencyLabel.leftAnchor.constraint(equalTo: mainCarrencyFlagImage.rightAnchor, constant: 5).isActive = true
        mainCurrencyLabel.centerYAnchor.constraint(equalTo: mainCarrencyFlagImage.centerYAnchor).isActive = true
        mainCurrencyLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        mainCurrencyLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        mainCurrecnySelectButton.leftAnchor.constraint(equalTo: mainCurrencyLabel.rightAnchor, constant: 5).isActive = true
        mainCurrecnySelectButton.centerYAnchor.constraint(equalTo: mainCarrencyFlagImage.centerYAnchor).isActive = true
        mainCurrecnySelectButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        mainCurrecnySelectButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        mainInputTf.rightAnchor.constraint(equalTo: exchangeView.rightAnchor, constant: -20).isActive = true
        mainInputTf.centerYAnchor.constraint(equalTo: mainCarrencyFlagImage.centerYAnchor).isActive = true
        mainInputTf.leftAnchor.constraint(equalTo: mainCurrecnySelectButton.rightAnchor, constant: 20).isActive = true
        mainInputTf.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        secondCarrencyFlagImage.leftAnchor.constraint(equalTo: exchangeView.leftAnchor, constant: 20).isActive = true
        secondCarrencyFlagImage.topAnchor.constraint(equalTo: seperatorView.bottomAnchor, constant: 55).isActive = true
        secondCarrencyFlagImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        secondCarrencyFlagImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        secondCurrencyLabel.leftAnchor.constraint(equalTo: secondCarrencyFlagImage.rightAnchor, constant: 5).isActive = true
        secondCurrencyLabel.centerYAnchor.constraint(equalTo: secondCarrencyFlagImage.centerYAnchor).isActive = true
        secondCurrencyLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        secondCurrencyLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        secondCurrecnySelectButton.leftAnchor.constraint(equalTo: secondCurrencyLabel.rightAnchor, constant: 5).isActive = true
        secondCurrecnySelectButton.centerYAnchor.constraint(equalTo: secondCarrencyFlagImage.centerYAnchor).isActive = true
        secondCurrecnySelectButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        secondCurrecnySelectButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        secondInputTf.rightAnchor.constraint(equalTo: exchangeView.rightAnchor, constant: -20).isActive = true
        secondInputTf.centerYAnchor.constraint(equalTo: secondCarrencyFlagImage.centerYAnchor).isActive = true
        secondInputTf.leftAnchor.constraint(equalTo: secondCurrecnySelectButton.rightAnchor, constant: 20).isActive = true
        secondInputTf.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        curenciesInfoCollection.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 20).isActive = true
        curenciesInfoCollection.leftAnchor.constraint(equalTo: whiteView.leftAnchor).isActive = true
        curenciesInfoCollection.rightAnchor.constraint(equalTo: whiteView.rightAnchor).isActive = true
        curenciesInfoCollection.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor).isActive = true
        
        currenciesListCollection.topAnchor.constraint(equalTo: mainCarrencyFlagImage.bottomAnchor, constant: 5).isActive = true
        currenciesListCollection.leftAnchor.constraint(equalTo: exchangeView.leftAnchor, constant: 20).isActive = true
        currenciesListCollection.rightAnchor.constraint(equalTo: exchangeButton.leftAnchor, constant: -5).isActive = true
        currencyMenuHeightAnchor = currenciesListCollection.heightAnchor.constraint(equalToConstant: 0)
        currencyMenuHeightAnchor?.isActive = true
        
    }
    
    fileprivate func toolBarSetup() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.finishedWithInput))
        doneButton.tintColor = .black
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        mainInputTf.inputAccessoryView = toolBar
        secondInputTf.inputAccessoryView = toolBar
    }
    
    fileprivate func addElements() {
        view.addSubview(wavesImage)
        view.addSubview(whiteView)
        view.addSubview(exchangeView)
        exchangeView.addSubview(exchangeButton)
        exchangeView.addSubview(seperatorView)
        exchangeView.addSubview(mainCarrencyFlagImage)
        exchangeView.addSubview(mainCurrencyLabel)
        exchangeView.addSubview(mainCurrecnySelectButton)
        exchangeView.addSubview(mainInputTf)
        exchangeView.addSubview(secondCarrencyFlagImage)
        exchangeView.addSubview(secondCurrencyLabel)
        exchangeView.addSubview(secondCurrecnySelectButton)
        exchangeView.addSubview(secondInputTf)
        whiteView.addSubview(curenciesInfoCollection)
        exchangeView.addSubview(currenciesListCollection)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        addElements()
        curenciesInfoCollection.delegate = self
        curenciesInfoCollection.dataSource = self
        currenciesListCollection.delegate = self
        currenciesListCollection.dataSource = self
        setupNavBar()
        setupView()
        toolBarSetup()
        uploadCurrencyInfo(currency: selectedCurrency)
        mainInputTf.delegate = self
        secondInputTf.delegate = self
    }


}
