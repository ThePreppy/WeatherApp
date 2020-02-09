//
//  CitiesController.swift
//  WeatherApp
//
//  Created by Александр on 07.02.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class CitiesController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: CitiesControllerModelType = CitiesViewModel()
    
    //MARK: - ControllerLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCities()
    }
    
    //MARK: - Methods
    private func initialSetup() {
        setupTableView()
        navigationItem.title = "Cities"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: CityCell.reuseID, bundle: nil),
                           forCellReuseIdentifier: CityCell.reuseID)
    }
    
    private func fetchCities() {
        viewModel.fetchCities { [weak self] (success) in
            if success {
                self?.tableView.reloadData()
            } else {
                self?.showAlert(title: "Error", message: "Something went wrong, try again later")
            }
        }
    }
    
    
    @IBAction func settingsAction(_ sender: Any) {
        let settingsController = UIStoryboard.instantiateController(forModule: .Main, vcIdentifier: .SettingsController)
        navigationController?.pushViewController(settingsController, animated: true)
    }
    
}

//MARK: = UITableViewDataSource
extension CitiesController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.reuseID, for: indexPath) as? CityCell else { return UITableViewCell() }
        
        let cellViewModel = viewModel.viewModelForCell(atIndexPath: indexPath)
        cell.viewModel = cellViewModel
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension CitiesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailController = UIStoryboard.instantiateController(forModule: .Main, vcIdentifier: .CityDetail) as? CityDetailController else { return }
        
        let detailControllerViewModel = viewModel.didSelectRow(atIndexPath: indexPath)
        detailController.viewModel = detailControllerViewModel
        navigationController?.pushViewController(detailController, animated: true)
    }
}
