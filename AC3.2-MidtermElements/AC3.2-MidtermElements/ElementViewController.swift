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
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = catchTheElements.name
        elementLabel.text = "Symbol: \(catchTheElements.symbol)\nNumber: \(catchTheElements.number)\nWeight: \(catchTheElements.weight)\nBoiling Point: \(catchTheElements.boilingPoint)\nMelting Point: \(catchTheElements.meltingPoint)"
    }
}
