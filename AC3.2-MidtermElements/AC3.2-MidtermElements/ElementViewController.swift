//
//  ElementViewController.swift
//  AC3.2-MidtermElements
//
//  Created by Margaret Ikeda on 12/8/16.
//  Copyright © 2016 Margaret Ikeda. All rights reserved.
//

import UIKit
var my_name = "Margaret Ikeda"
var favorite_element = "Scandium"
class ElementViewController: UIViewController {
    var catchTheElements: Element!
    var postEndpoint = "https://api.fieldbook.com/v1/58488d40b3e2ba03002df662/favorites"
    //I know this is how it should be, but I'm having property intializer problems. So my favorite element will always be Scandium :-(
    //var postDict = [my_name : catchTheElements.name]
    var postDict = [my_name : favorite_element]
    @IBOutlet weak var elementLabel: UILabel!
    @IBOutlet weak var elementImageView: UIImageView!
    @IBAction func favoritesButton(_ sender: UIButton) {
    }
    @IBAction func postRequest (_ sender: UIButton) {
        APIRequestManager.manager.postRequest(endPoint: postEndpoint, data: postDict)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = catchTheElements.name
        elementLabel.text = "Symbol: \(catchTheElements.symbol)\nNumber: \(catchTheElements.number)\nAtomic Weight: \(catchTheElements.weight)\nBoiling Point: \(catchTheElements.boilingPoint) degrees Celsius\nMelting Point: \(catchTheElements.meltingPoint) degrees Celsius"
        
        
        
        APIRequestManager.manager.getData(endPoint: (catchTheElements.detailImage)) { (data: Data?) in
            guard let validData = data else { return }
            DispatchQueue.main.async {
                self.elementImageView.image = UIImage(data: validData)
                self.view.reloadInputViews()
            }
        }
    }
}
