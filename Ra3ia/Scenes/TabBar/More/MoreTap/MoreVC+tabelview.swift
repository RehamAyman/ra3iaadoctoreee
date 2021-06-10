//
//  MoreVC+tabelview.swift
//  Ra3ia
//
//  Created bySara Mady on 3/21/21.
//

import UIKit
import ViewAnimator

extension MoreVC : UITableViewDelegate , UITableViewDataSource {
    
    func SetUpTableView () {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    //MARK: - tableview delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getcellsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "MoreSettingCell", for: indexPath) as! MoreSettingCell
        presenter.configure(cell: cell, for: indexPath.row)
        cell.selectionStyle = .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.didSelectRow(index: indexPath.row)
//        switch indexPath.row {
//        case 0 :
//
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "PersonalInfoVC") as? PersonalInfoVC {
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        }
//
//
//        case 1 :
//
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "LanguageVC") as? LanguageVC{
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//
//        case 2 :
//
//
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "MyClientsVC") as? MyClientsVC {
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//
//        case 3 :
//
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "MyRecipesVC") as? MyRecipesVC {
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//
//        case 4 :
//
//
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "MyReviewVC") as? MyReviewVC {
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//        case 5 :
//
//
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "staticksVC") as? staticksVC {
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//
//
//
//        case 6 :
//
//
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "CallUsVC") as? CallUsVC {
//                        self.navigationController?.pushViewController(vc, animated: true)
//                    }
//
//
//        case 7 :
//
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "UsagePolicyVC") as? UsagePolicyVC {
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//        case 8 :
//
//
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "AboutAppVC") as? AboutAppVC {
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//
//            // elshkawa wl moktrahat
//        case 9 :
//
//
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "ComplaintsVC") as? ComplaintsVC {
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//        case 10 :
//
//
//            self.dismiss(animated: true, completion: nil)
//
//
//
//
//        default:
//            break
//        }
    }
    
    
}
