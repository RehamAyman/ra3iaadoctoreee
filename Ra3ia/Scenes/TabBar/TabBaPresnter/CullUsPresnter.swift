//
//  CullUsPresnter.swift
//  Ra3ia
//
//  Created by Sara Mady on 13/04/2021.
//

import Foundation
//MARK:- protocols

protocol CullUsView : class {
    func openFaceBook(link:String)
    func openTwitter(link:String)
    func openWhatsApp(link:String)
    func openInstagram(link:String)
    func openLinkedIn(link:String)
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func setDate(email:String,phone:String,whatsApp:String)
}

//MARK:- presenter class

class  CullUsPresnter {
    
    //MARK:- 1 variabals
    private weak var view : CullUsView?
    var titter = ""
    var faceBook = ""
    var whatsApp = ""
    var Instgram = ""
    var LinkedIn = ""
    
    
    //MARK:- 2 view initionalizer
    
    init(view : CullUsView) {
        self.view = view
    }
    func viewWillApper(){
        getSocialData()
    }
    
    func getSocialData(){
        view?.showIndicator()
        TabBarinteractor.social.send(SocialModel.self){
            [weak self] (response) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                
                self.titter = value.data.twitter
                self.Instgram = value.data.instagram
                self.whatsApp = value.data.whatsapp
                self.LinkedIn = value.data.linkedin
                self.faceBook = value.data.facebook
                self.view?.setDate(email: value.data.email, phone: value.data.phone, whatsApp: value.data.whatsapp)
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
   
    func openFaceBook(){
        self.view?.openFaceBook(link: faceBook)
    }
    func openWhatApp(){
        self.view?.openWhatsApp(link: whatsApp)
    }
    func openLinkedIn(){
        self.view?.openLinkedIn(link: LinkedIn)
    }
    func openTwtter(){
        self.view?.openTwitter(link: titter)
    }
    func openInstgram(){
        self.view?.openInstagram(link: Instgram)
    }
}
