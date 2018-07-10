//
//  CurrencyCell.swift
//  Light Currency
//
//  Created by Uladzislau Daratsiuk on 7/9/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class CurrencyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    lazy var flagImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    let mainCurrencyName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.text = "0 - "
        return label
    }()

    
    func  setupView(){
        
        addSubview(mainCurrencyName)
        addSubview(flagImage)
        addSubview(rateLabel)
        addSubview(resultLabel)
        
        flagImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        flagImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        flagImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        flagImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        mainCurrencyName.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor).isActive = true
        mainCurrencyName.leftAnchor.constraint(equalTo: flagImage.rightAnchor,constant: 5).isActive = true
        mainCurrencyName.widthAnchor.constraint(equalToConstant: 40).isActive = true
        mainCurrencyName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        rateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        rateLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        rateLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        resultLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor).isActive = true
        resultLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10).isActive = true
        resultLabel.leftAnchor.constraint(equalTo: rateLabel.rightAnchor, constant: 10).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    public func updateCellData(currency: Currency, amount: Double){
        mainCurrencyName.text = currency.name
        flagImage.image = UIImage(named: currency.name)
        rateLabel.text = String(currency.rate)
        resultLabel.text = String(amount) + "-"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
