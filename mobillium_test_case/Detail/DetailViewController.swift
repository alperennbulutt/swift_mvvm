//
//  DetailViewController.swift
//  mobillium_test_case
//
//  Created by Alperen Bulut on 25.11.2023.
//

import UIKit

class DetailViewController: UIViewController {
    static let identifier = "DetailViewController"
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    @IBOutlet weak var launchDateAndClock: UIView!
    
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    @IBOutlet weak var containerLabel: UIView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var containerViewSecond: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        
        headerTitleLabel.font = UIFont(name: "Inter-Medium", size: 16)
        headerTitleLabel.textAlignment = .center
        headerTitleLabel.text = "Past Lanch"
        
        // launch date and clock part-
        launchDateAndClock.layer.cornerRadius = 10.0
        launchDateAndClock.translatesAutoresizingMaskIntoConstraints = false
        launchDateAndClock.widthAnchor.constraint(equalToConstant: 335).isActive = true
        launchDateAndClock.heightAnchor.constraint(equalToConstant: 68).isActive = true
        launchDateAndClock.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        // info cell
        detailCollectionView.register(UINib(nibName: InfoCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: InfoCollectionViewCell.identifier)
        
        // container first
     
      
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(red: 0.953, green: 0.957, blue: 0.98, alpha: 1).cgColor
        
        
        // container second
        containerViewSecond.layer.cornerRadius = 10
        containerViewSecond.layer.borderWidth = 1
        containerViewSecond.layer.borderColor = UIColor(red: 0.953, green: 0.957, blue: 0.98, alpha: 1).cgColor


 
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
    }
    
    
    

}


extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCollectionViewCell.identifier, for: indexPath) as! InfoCollectionViewCell

        cell.configure()
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: collectionView.layer.bounds.width / 2 - 5 , height: 72)
        }
    
    
    func collectionView( collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            // Set the minimum spacing between items in the same row
        return 0
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }

        func collectionView( collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            // Set the spacing around the entire section
            return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        }
    
    
}
