//
//  staticsVCpresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import Foundation
//MARK:- protocols

protocol staticksView : class {
    func fetchingDataSuccess()
    func showIndicator()
    func hideIndicator()
    func setup ()
    func FeatchData()
    func showError(error:String)
}

// tabelcells

protocol StaticsTabelCellView {
    func setImage ( image : String)
    func SenderName ( name : String)
    func setdetails ( details : String)
   
     
}
protocol StaticsCollectionCellView {
    func setStaticImage ( image : String)
    func setMainNum ( num : String)
    func setDetails ( details : String)
}

//MARK:- presenter class

class  staticsVCpresenter {
    
    //MARK:- 1 variabals
    private weak var view : staticksView?
    var Staticsimages = ["coin" , "treet" , "chats" ]
    var details = ["Profits Percentage".localized,"Acceptable Treatment".localized,"Messages".localized]
    var mainNum = [String]()
    var NewRooms = [NewRoom]()
    
    //MARK:- 2 view initionalizer
    
    init(view : staticksView) {
        self.view = view
    }
    
    func viewWillApper(){
        self.mainNum.removeAll()
        self.NewRooms.removeAll()
        self.view?.fetchingDataSuccess()
        self.view?.FeatchData()
        self.getDoctorStatistics()
    }
    func getDoctorStatistics(){
        view?.showIndicator()
        TabBarinteractor.doctorStatistics.send(DoctorStatisticsModel.self){
            [weak self] (response) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.mainNum.append(value.data.profits)
                self.mainNum.append(String(value.data.acceptedPrescriptionsCount))
                self.mainNum.append(String(value.data.roomsCount))
                self.NewRooms =  value.data.rooms
                self.view?.FeatchData()
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    //MARK: - 3 class functions
    func configurCollectionCells(cell: StaticsCollectionCellView, for index: Int) {
        cell.setMainNum(num: mainNum[index])
        cell.setStaticImage(image: Staticsimages[index])
        cell.setDetails(details: details[index])
    }
    func configerTabelCells ( cell : StaticsTabelCellView , for index : Int){
        cell.SenderName(name: self.NewRooms[index].senderName)
        cell.setImage(image: self.NewRooms[index].senderAvatar)
        cell.setdetails(details: self.NewRooms[index].lastMessageContent)
    }
    func getCollectioncellsCount () -> Int {
        return mainNum.count
    }
    func getNumberOFRooms()->Int{
        return NewRooms.count
    }
}
