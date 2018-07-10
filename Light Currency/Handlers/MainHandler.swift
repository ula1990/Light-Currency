//
//  MainHandler.swift
//  Light Currency
//
//  Created by Uladzislau Daratsiuk on 7/9/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

extension MainVC {
        @objc public func handleMenu(){
        
    }
    
    @objc public func selectMainCurrency(){
        if (currencyMenuShowing){
            UIView.animate(withDuration: 0.3) {
                self.currencyMenuHeightAnchor?.isActive = false
                self.currencyMenuHeightAnchor = self.currenciesListCollection.heightAnchor.constraint(equalToConstant: 0)
                self.currencyMenuHeightAnchor?.isActive = true
                self.view.layoutIfNeeded()
            }
        }else{
            UIView.animate(withDuration: 0.3, animations: {
                self.currencyMenuHeightAnchor?.isActive = false
                self.currencyMenuHeightAnchor = self.currenciesListCollection.heightAnchor.constraint(equalToConstant: 45)
                self.currencyMenuHeightAnchor?.isActive = true
                self.view.layoutIfNeeded()
            }) { (true) in
            }
        }
        currencyMenuShowing = !currencyMenuShowing
    }
    
        @objc public func handleShare(){
            let activityVC = UIActivityViewController(activityItems: ["Take a look on amazing currency converter"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
    }
    
    @objc public func uploadCurrencyInfo(currency: String){
        guard let url = URL(string: urlString + currency) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil{
                    Alert.showBasic(title: "No connection", msg: "Please check your connection", vc: self)
                }
                else{
                    if data != nil{
                        self.currenciesList.removeAll()
                        do{
                            let json = try JSONDecoder().decode(CurrencyData.self, from: data!)
                            print(json)
                            for (key , value) in json.rates{
                                let newCurrency = Currency(name: key, rate: round((value)*10000)/10000)
                                self.currenciesList.append(newCurrency)
                            }
                            
                        }
                        catch{
                            print(error)
                        }
                    }
                }
                self.curenciesInfoCollection.reloadData()
                self.currenciesListCollection.reloadData()
                self.handleMainInput()
            }
        }
        task.resume()
    }
    
    @objc public func finishedWithInput (){
        view.endEditing(true)
    }
    
    @objc public func handleMainInput(){
        if mainInputTf.text?.isEmpty == true {
            print(Error.self)
            currentAmount.removeAll()
            currentAmount = currenciesList.map{ $0.rate * 0.0 }
            curenciesInfoCollection.reloadData()
        }else{
            currentAmount.removeAll()
            currentAmount = currenciesList.map{ round(($0.rate * Double(mainInputTf.text!)!)*100)/100 }
            curenciesInfoCollection.reloadData()
        }
    }
}
