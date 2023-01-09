//
//  NoteDetailVC-TVDataSource.swift
//  LittlePink
//
//  Created by JZ_MacMini on 2023/1/6.
//

import Foundation

extension NoteDetailVC:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kReplyCellID, for: indexPath);
        cell.textLabel?.text = "wefwe";
        return cell;
    }
    
    
}
