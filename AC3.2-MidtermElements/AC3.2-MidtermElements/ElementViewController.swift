//
//  ElementViewController.swift
//  AC3.2-MidtermElements
//
//  Created by Margaret Ikeda on 12/8/16.
//  Copyright © 2016 Margaret Ikeda. All rights reserved.
//

import UIKit

class ElementViewController: UIViewController {
    var catchTheElements: Element!
    @IBOutlet weak var elementLabel: UILabel!
    @IBOutlet weak var elementImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = catchTheElements.name
        elementLabel.text = "Symbol: \(catchTheElements.symbol)\nNumber: \(catchTheElements.number)\nWeight: \(catchTheElements.weight)\nBoiling Point: \(catchTheElements.boilingPoint) degrees Celsius\nMelting Point: \(catchTheElements.meltingPoint) degrees Celsius"
        APIRequestManager.manager.getData(endPoint: (catchTheElements.detailImage)) { (data: Data?) in
            guard let validData = data else { return }
            DispatchQueue.main.async {
                self.elementImageView.image = UIImage(data: validData)
                self.view.reloadInputViews()
            }
        }
    }
}
