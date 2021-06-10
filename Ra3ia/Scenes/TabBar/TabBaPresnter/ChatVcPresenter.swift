//
//  ChatVcPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/27/21.
//

//import Foundation
//protocol chatView : class {
//    func fetchingData ()
//    func showIndicator ()
//    func setUpTable ()
//    func showError(error:String)
//    func hideIndicator()
//
//}
//
//
//class  ChatVCpresenter {
//    
//    //MARK:- 1 variabals
//    private weak var view : chatView?
// 
//    //MARK:- 2 view initionalizer
//    
//    init(view : chatView) {
//        self.view = view
//    }
//    
//    
//    func configerTypeCells ( cell : chatView , for index : Int){
//        // api issues 
//    }
//    
//    func getChatData(id:String){
//        view?.showIndicator()
//        TabBarinteractor.doctorSingleRoom(id: id).send(ChatModel.self){
//            [weak self] (response) in
//            guard let self = self else { return }
//            self.view?.hideIndicator()
//            switch response {
//            case .unAuthorized(_):
//                print("unAuthorized")
//            case .failure(let error):
//                print("failure\(String(describing: error))")
//            case .success(let value):
//                self.view?.fetchingData()
//            case .errorResponse(let error):
//                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
//                self.view?.showError(error: errorMessage.localizedDescription.localized)
//            }
//        }
//    }
//    
//    
//    
//}
