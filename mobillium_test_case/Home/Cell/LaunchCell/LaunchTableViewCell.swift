//
//  LaunchTableViewCell.swift
//  mobillium_test_case
//
//  Created by Alperen Bulut on 25.11.2023.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {
    
    static let identifier = "LaunchTableViewCell"

    
    @IBOutlet weak var circularImageView: UIImageView!
    @IBOutlet weak var launchNameLabel: UILabel!
    @IBOutlet weak var launchDateLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
  
    }
    
    private func setup() {
        //
        launchNameLabel.textColor = UIColor(red: 0.09, green: 0.106, blue: 0.22, alpha: 1)
        launchNameLabel.font = UIFont(name: "Inter-SemiBold", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.18
        launchNameLabel.attributedText = NSMutableAttributedString(string: "CRS-20", attributes: [NSAttributedString.Key.kern: -0.08, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        //
        launchDateLabel.textColor = UIColor(red: 0.506, green: 0.523, blue: 0.643, alpha: 1)
        launchDateLabel.font = UIFont(name: "Inter-Medium", size: 13)
        var paragraphStyle2 = NSMutableParagraphStyle()
        paragraphStyle2.lineHeightMultiple = 1.27
        launchDateLabel.attributedText = NSMutableAttributedString(string: "2020-03-07 - 04:50", attributes: [NSAttributedString.Key.kern: -0.08, NSAttributedString.Key.paragraphStyle: paragraphStyle2])
        
        //
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(red: 0.953, green: 0.957, blue: 0.98, alpha: 1).cgColor
    }
    
    func configure(pastmodel:PastModel) {
        //name
        launchNameLabel.text = pastmodel.name
        //date
        launchDateLabel.text = pastmodel.dateUTC
        //image
        if let url = URL(string: pastmodel.links.patch.small) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.circularImageView.image = UIImage(data: data)
                }
            }
            
             task.resume()
        }
    }
    
    
    
}
