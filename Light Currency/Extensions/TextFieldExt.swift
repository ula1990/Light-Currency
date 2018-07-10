//
//  TextFieldExtension.swift
//  EURCurrencyConverter
//
//  Created by Uladzislau Daratsiuk on 05/06/2018.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

extension MainVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == mainInputTf {

        //Prevent "0" characters as the first characters. (i.e.: There should not be values like "003" "01" "000012" etc.)
        if mainInputTf.text?.count == 0 && string == "0" {
            Alert.showBasic(title: "Incorrect input", msg: "First number can't be 0", vc: self)
            return false
        }
        //Limit the character count to 10.
        if ((mainInputTf.text!) + string).count > 10 {
            Alert.showBasic(title: "Max Length", msg: "Maximum amount of numbers in the field is 10", vc: self)
            return false
        }
        //Have a decimal keypad. Which means user will be able to enter Double values. (Needless to say "." will be limited one)
        if (mainInputTf.text?.contains("."))! && string == "."  {
            Alert.showBasic(title: "Incorrect input", msg: "Please check the field", vc: self)
            return false
        }
        //Only allow numbers. No Copy-Paste text values.
        let allowedCharacterSet = CharacterSet.init(charactersIn: "0123456789.")
        let textCharacterSet = CharacterSet.init(charactersIn: mainInputTf.text! + string)
        if !allowedCharacterSet.isSuperset(of: textCharacterSet) {
            return false
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
            
        return true
        
    }else{
        //Prevent "0" characters as the first characters. (i.e.: There should not be values like "003" "01" "000012" etc.)
        if secondInputTf.text?.count == 0 && string == "0" {
            Alert.showBasic(title: "Incorrect input", msg: "First number can't be 0", vc: self)
            return false
        }
        //Limit the character count to 10.
        if ((secondInputTf.text!) + string).count > 10 {
            Alert.showBasic(title: "Max Length", msg: "Maximum amount of numbers in the field is 10", vc: self)
            return false
        }
        //Have a decimal keypad. Which means user will be able to enter Double values. (Needless to say "." will be limited one)
        if (secondInputTf.text?.contains("."))! && string == "."  {
            Alert.showBasic(title: "Incorrect input", msg: "Please check the field", vc: self)
            return false
        }
        //Only allow numbers. No Copy-Paste text values.
        let allowedCharacterSet = CharacterSet.init(charactersIn: "0123456789.")
        let textCharacterSet = CharacterSet.init(charactersIn: secondInputTf.text! + string)
        if !allowedCharacterSet.isSuperset(of: textCharacterSet) {
            return false
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
            }
            
        return true
        }
    }
}
