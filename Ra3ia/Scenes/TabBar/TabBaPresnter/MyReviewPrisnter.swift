//
//  MyReviewPrisnter.swift
//  Ra3ia
//
//  Created by Sara Mady on 12/04/2021.
//

import Foundation

//MARK:- protocols
protocol MyReviewView : class {
    func FeatchData(rate:String)
    func showIndicator()
    func hideIndicator()
    func showError(error:String)

}


// note :  same home cells with the same cell protocol (ConvCellView)

//MARK:- presenter class

class MyReviewPrisnter {
    //MARK:- 1 variabals
    private weak var view : MyReviewView?

    //MARK:- 2 view initionalizer
    
    init(view: MyReviewView) {
        self.view = view
    }
    

    //MARK: - 3 class functions
    
    func viewWillApper(){
        self.getMessagesRequest()
    }
    func getMessagesRequest(){
        view?.showIndicator()
        TabBarinteractor.rate.send(rateModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
                self.view?.FeatchData(rate: value.data.rate)
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    
    
}
