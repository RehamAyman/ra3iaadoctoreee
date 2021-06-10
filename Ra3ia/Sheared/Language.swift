//
//  Language.swift
//  SeaTrips
//
//  Created by Sara Mady on 10/27/20.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation

class Language {
    class func currentLanguage() -> String {
        let def = UserDefaults.standard
        if let lang = def.object(forKey: "lang") as? String{
            return lang
        }else{
            return ""
        }

    }
    
    class func setAppLanguage(lang: String) {
        let def = UserDefaults.standard
        def.set(lang, forKey: "lang")
        def.synchronize()
    }
    
    class func getLang() -> String{
     //   print("🎠\(currentLanguage())")
       return (currentLanguage().contains("en")) ? "en" : "ar"
    }
    
}

class AppLanguage {
    class func currentLanguage() -> String {
        let def = UserDefaults.standard
        let langs = def.object(forKey: "AppleLanguages") as! NSArray
        let firstLang = langs.firstObject as! String
        return firstLang
    }
    
    class func getLang() -> String{
        print("🎠\(currentLanguage())")
       return (currentLanguage().contains("en")) ? "en" : "ar"
    }
    
    
   class func setAppLanguage(lang: String) {
        let def = UserDefaults.standard
        let langs = def.object(forKey: "AppleLanguages") as! NSArray
        var selectedLang = lang
        for l in langs {
            if (l as! String).contains(lang){
                selectedLang = l as! String
            }
        }
        def.set([selectedLang, currentLanguage()], forKey: "AppleLanguages")
        def.synchronize()
    }
}
