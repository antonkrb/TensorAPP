//
//  SubsTableViewControllers.swift
//  TensorAPP
//
//  Created by ААА on 28.10.16.
//  Copyright © 2016 Anton Korobeynikov. All rights reserved.
//

import UIKit

class SubsTableViewControllers: UITableViewController {
    var htitle = ""
    var pFolder = [String]()
    var SubsObject = NSObject()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        title = htitle
        
        for element in SubsObject as! NSArray{
            let element = element as! [String: Any]
            //                    dvc.pFolder.append(element as! String)
            //print(element["title"])
            
            pFolder.append(element["title"] as! String)
            
        }
       // pFolder.removeAll()
        
       // for element in pFolder {
       //     pFolder.append(element["title"]! as! String)
       // }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "upfolder"{
            if let IndexPath = tableView.indexPathForSelectedRow{
                let dvc = segue.destination as! SubsTableViewControllers
                dvc.pFolder.removeAll()
                dvc.htitle = self.pFolder[IndexPath.row]
                
//                dvc.SubsObject = SubsObject
//                print(SubsObject)
               let name = self.pFolder[IndexPath.row]
                
                for element in SubsObject as! NSArray {
                    
                   let element = element as! [String: Any]
                   let nametitle = element["title"]!
                    if let msubs = element["subs"] as? [AnyObject]  {
                        if nametitle as! String == name {
                       dvc.SubsObject = msubs as NSObject
                        return
                    }
                    } else {
                        let mSub = [NSObject]()
                        dvc.SubsObject  = mSub as NSObject
                    }
                   
                }
                
                
            }
        }
    }
    
    

    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! titleTableViewCell
        cell.nameLabel.text = pFolder[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pFolder.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
}
