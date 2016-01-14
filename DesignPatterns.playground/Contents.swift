//: Playground - noun: a place where people can play

import UIKit


//Mark: factory design pattern implementation
//Def: Factory design pattern comes under creational design pattern. It is used to replace class constructors, abstracting the process of object generation so that the type of the object instantiated can be determined at run-time.

protocol Currency {
    func Symbol() -> String
    func Code() -> String
}

class Euro: Currency {
    func Symbol() -> String {
        return "€"
    }
    
    func Code() -> String {
        return "EUR"
    }
}

class UnitedStatesDolar: Currency {
    func Symbol() -> String {
        return "$"
    }
    
    func Code() -> String {
        return "USD"
    }
}

class UnitedKingdomPound: Currency {
    func Symbol() -> String {
        return "£"
    }
    
    func Code() -> String {
        return "GBP"
    }
}


enum Country {
    case France, Germany, Spain, UK, UnitedStates
}

class CurrencyFactory {
    class func currencyForCountry(country : Country) -> Currency? {
        switch country{
            case .France,.Germany,.Spain :
                return Euro()
            case .UK :
                return UnitedKingdomPound()
            case .UnitedStates :
                return UnitedStatesDolar()
        }
    }
}

//usages
let noCurrencyCode = "No Currency Code Available"
let noCurrencySymbol = "No Currency Symbol available"
CurrencyFactory.currencyForCountry(.France)?.Symbol() ?? noCurrencySymbol
CurrencyFactory.currencyForCountry(.UnitedStates)?.Code() ?? noCurrencyCode


