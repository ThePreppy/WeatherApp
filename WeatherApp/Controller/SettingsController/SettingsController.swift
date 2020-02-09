//
//  SettingsController.swift
//  WeatherApp
//
//  Created by Александр on 09.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {

    
    @IBOutlet weak var unitsSegment: UISegmentedControl!
    
    let viewModel: SettingsModelType = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    private func initialSetup() {
        unitsSegment.selectedSegmentIndex = viewModel.chosenValue()
        navigationItem.title = "Settings"
    }

    @IBAction func unitsSegmentValueChanged(_ sender: Any) {
        let chosenSegment = unitsSegment.selectedSegmentIndex
        viewModel.segmentValueDidChanged(segment: chosenSegment)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
