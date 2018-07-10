//
//  CurrencyCollectionExt.swift
//  Light Currency
//
//  Created by Uladzislau Daratsiuk on 7/9/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == curenciesInfoCollection{
            return currenciesList.count
        }else if collectionView == currenciesListCollection{
            return currenciesList.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == curenciesInfoCollection{
            let rate = currenciesList[indexPath.row]
            let amount = currentAmount[indexPath.row]
            let cell = curenciesInfoCollection.dequeueReusableCell(withReuseIdentifier: currencyCellId, for: indexPath) as! CurrencyCell
            cell.layer.cornerRadius = 10
            cell.backgroundColor = UIColor(named: "background")
            cell.updateCellData(currency: rate, amount: amount)
            return cell
        }else if collectionView == currenciesListCollection{
            let rate = currenciesList[indexPath.row]
            let cell = currenciesListCollection.dequeueReusableCell(withReuseIdentifier: selectCurrencyCellId, for: indexPath) as! SelectCurrencyCell
            cell.updateCellData(currency: rate)
            cell.backgroundColor = UIColor(named: "background")
            cell.layer.cornerRadius = 5
            return cell
        }else{
            let cell = curenciesInfoCollection.dequeueReusableCell(withReuseIdentifier: currencyCellId, for: indexPath) as! CurrencyCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == curenciesInfoCollection{

        }else if collectionView == currenciesListCollection{
            let rate = currenciesList[indexPath.row]
            mainCarrencyFlagImage.image = UIImage(named: rate.name)
            mainCurrencyLabel.text = rate.name
            selectedCurrency = rate.name
            uploadCurrencyInfo(currency: selectedCurrency)
            selectMainCurrency()
        }else{
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == curenciesInfoCollection{
        return CGSize(width: view.frame.width - 20, height: 60)
            }else if collectionView == currenciesListCollection{
            return CGSize(width: 85, height: 40)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == curenciesInfoCollection{
        return UIEdgeInsets(top: 10, left: 1, bottom: 1, right: 1)
            }else if collectionView == currenciesListCollection{
            return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        }else{
            return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        }
    }
    
    
}
