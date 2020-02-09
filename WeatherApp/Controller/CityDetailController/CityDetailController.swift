//
//  CityDetailController.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class CityDetailController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var weatherStatusImageView: ImageLoader!
    @IBOutlet weak var weatherStatus: UILabel!
    @IBOutlet weak var tempretureLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    var viewModel: CityDetailModelType?
    
    //MARK: - ControllerLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = viewModel?.cityName
        fetchWeather()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: - Methods
    private func fetchWeather() {
        view.beginAnimating()
        viewModel?.fetchWeather(completion: { [weak self] (error) in
            guard let strongSelf = self else { return }
            if error == nil {
                guard let cityWeather = strongSelf.viewModel?.cityWeather else { return }
                
                DispatchQueue.main.async {
                    strongSelf.setupUI(cityWeather: cityWeather)
                }
                
            } else {
                strongSelf.showAlert(title: "Error", message: error?.localizedDescription)
            }
            DispatchQueue.main.async {
                strongSelf.view.endAnimating()
            }
        })
    }
    
    private func setupUI(cityWeather: CityDetail) {
        let unit = UserManager.getChosenUnits() ?? "C"
        self.tempretureLabel.text = "\(cityWeather.main.temp) °\(unit)"
        self.weatherStatus.text = cityWeather.weather.first?.weatherDescription.capitalized
        self.feelsLikeLabel.text = "Feels like: \(cityWeather.main.feelsLike) °\(unit)"
        self.windSpeedLabel.text = "Wind speed: \(cityWeather.wind.speed)"
        
        let sunset = Date.dateFrom(timestamp: cityWeather.sys.sunset)
        let sunrise = Date.dateFrom(timestamp: cityWeather.sys.sunrise)
        self.sunsetLabel.text = "Sunset: \(sunset)"
        self.sunriseLabel.text = "Sunrise: \(sunrise)"
        let currentTime = Date.dateAccordingToTimezone(seconds: cityWeather.timezone)
        self.todayLabel.text! += ", \(currentTime)"
        
        
        if let iconName = cityWeather.weather.first?.icon , let urlStr = "http://openweathermap.org/img/wn/\(iconName)@2x.png".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: urlStr) {
            self.weatherStatusImageView.loadImageWithUrl(url)
        }
    }
    
}
