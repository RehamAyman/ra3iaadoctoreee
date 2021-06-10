//
//  StaticsVc+tableview.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit


extension staticksVC : UITableViewDelegate , UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.getNumberOFRooms()
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableview.dequeueReusableCell(withIdentifier: "StaticsTableCell", for: indexPath) as! StaticsTableCell
    presenter.configerTabelCells(cell: cell, for: indexPath.row)
    
    
    return cell
}
    
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
}
}
