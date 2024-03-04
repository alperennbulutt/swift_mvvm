//
//  HomeViewController.swift
//  mobillium_test_case
//
//  Created by Alperen Bulut on 25.11.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var headerTitleLabel: UILabel!
    
    private var pastModel: [PastModel] = []
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: LaunchTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: LaunchTableViewCell.identifier)
        tableView.separatorStyle = .none
        //
        headerTitleLabel.font = UIFont(name: "Inter-Medium", size: 16)
        headerTitleLabel.textAlignment = .center
        headerTitleLabel.text = "Launches"
        //
        let ntReq = NetworkRequest();
        ntReq.getPastEvent {result in
            switch result {
                        case .success(let data):
                            // Veriyi işleyerek ekranda gösterme
                            print(data.count)
                            self.pastModel = data
                            self.tableView.reloadData()

                        case .failure(let error):
                            // Hata durumunu işleme
                            print("API Hatası: (error)")
                        }
            
        }
    }
    
}


extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pastModel.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LaunchTableViewCell.identifier, for: indexPath) as! LaunchTableViewCell
        
        cell.configure(pastmodel: pastModel[indexPath.row])
        return cell
        
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            // Customize the height of each cell
            return 92 // Set your desired cell height here
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         // Seçilen hücreye tıklandığında yapılacak işlemler
        let selectedItem = indexPath.row
         print("Tıklanan öğe: \(selectedItem)")

      
         performSegue(withIdentifier: DetailViewController.identifier, sender: self)
        
 
     }
    
}
