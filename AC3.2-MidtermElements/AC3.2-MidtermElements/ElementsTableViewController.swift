//
//  ElementsTableViewController.swift
//  AC3.2-MidtermElements
//
//  Created by Margaret Ikeda on 12/8/16.
//  Copyright © 2016 Margaret Ikeda. All rights reserved.
//

import UIKit

class ElementsTableViewController: UITableViewController {
    var elementsArray = [Element]()
    var myEndpoint = "https://api.fieldbook.com/v1/58488d40b3e2ba03002df662/elements"
    override func viewDidLoad() {
        super.viewDidLoad()
        APIRequestManager.manager.getData(endPoint: myEndpoint) { (data: Data?) in
            if let validData = data,
                let elementThing = Element.getElements(data: validData) {
                self.elementsArray = elementThing
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }

        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath)
        let anElementThing = elementsArray[indexPath.row]
        cell.textLabel?.text = anElementThing.name
        cell.detailTextLabel?.text = anElementThing.name
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcDestination = segue.destination as? ElementViewController,
        let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) {
            vcDestination.catchTheElements = elementsArray[indexPath.row]
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
