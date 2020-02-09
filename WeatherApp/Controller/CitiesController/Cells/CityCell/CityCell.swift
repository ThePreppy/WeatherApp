//
//  CityCell.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var coordinatesLabel: UILabel!
    
    weak var viewModel: CityCellModelType? {
        willSet(newValue) {
            guard let model = newValue else { return }
            setupCell(withModel: model)
        }
    }
    static let reuseID = String(describing: CityCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setupCell(withModel model: CityCellModelType) {
        countryLabel.text = model.countryName
        cityLabel.text = model.cityName
        coordinatesLabel.text = "lat: \(model.coordinates.lat), lon: \(model.coordinates.lon)" 
    }
    
}
