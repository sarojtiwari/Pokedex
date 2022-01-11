//
//  PokemonListViewController.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//
//

import UIKit

class PokemonListViewController: UIViewController {
    
    private typealias activityCell = PokemonListActivityIndicatorCell
    // MARK: - Properties
    var presenter: PokemonListModuleInterface?
    var listOfData: PokemonList? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var isMoreDataAvailable: Bool = false
    var loadingData: Bool = false
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: - VC's Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        setupNavigation()
        presenter?.getPokemon()
    }
    
    // MARK: - IBActions
    
    // MARK: - Other Functions
    private func setupNavigation(){
        self.title = "Pokedex"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        if #available(iOS 15, *) {
               let appearance = UINavigationBarAppearance()
               appearance.configureWithOpaqueBackground()
               self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
           }
    }
    
    private func setup() {
        // all setup should be done here
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(activityCell.returnNIB(), forCellReuseIdentifier: activityCell.returnReuseIdentifier())
    }
}

// MARK: - TableView Delegate Function
extension PokemonListViewController: UITableViewDelegate {
    
}

// MARK: - Table View Data source Function
extension PokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard listOfData != nil else {return 0}
        return self.isMoreDataAvailable ? listOfData!.results.count + 1 : listOfData!.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.isMoreDataAvailable{
            if indexPath.row == listOfData?.results.count ?? 0 - 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: activityCell.returnReuseIdentifier()) as? activityCell
                self.loadingData = true
                cell?.activityIndicator.startAnimating()
                return cell ?? UITableViewCell()
            } else {
                loadingData = false
            }
        }
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.selectionStyle = .none
        guard listOfData != nil else {return cell}
        cell.textLabel?.text = self.listOfData!.results[indexPath.row].name
        if tableView.scrolledToBottom {
            if isMoreDataAvailable && !loadingData{
                self.presenter?.getPokemon()
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.isMoreDataAvailable {
            if indexPath.row == listOfData?.results.count ?? 0 - 1 {
                return
            }
        }
        presenter?.gotoDetail(id: indexPath.row + 1)
    }
}

// MARK: - PokemonListViewInterface
extension PokemonListViewController: PokemonListViewInterface {
    func gotError(error: Error) {
        let alertController = UIAlertController(title: "Error Detected", message: "\(error.localizedDescription)", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func reloadData(withData: PokemonList, pageNo: Int) {
        if self.listOfData != nil{
            listOfData?.results.append(contentsOf: withData.results)
        } else{
            self.listOfData = withData
        }
        self.isMoreDataAvailable = pageNo <= self.listOfData?.results.count ?? 0 ? true : false
    }
}

