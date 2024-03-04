//
//  InfoCollectionViewCell.swift
//  mobillium_test_case
//
//  Created by Alperen Bulut on 26.11.2023.
//

import UIKit

class InfoCollectionViewCell: UICollectionViewCell {
    static let identifier = "InfoCollectionViewCell"
    

    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    
    
    private func setup()
    {
        
        // first label
        firstLabel.textColor = UIColor(red: 0.506, green: 0.523, blue: 0.643, alpha: 1)
        firstLabel.font = UIFont(name: "Inter-Regular", size: 13)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.27
        firstLabel.attributedText = NSMutableAttributedString(string: "Landing Attempt", attributes: [NSAttributedString.Key.kern: -0.08, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        // second label
        secondLabel.textColor = UIColor(red: 0.09, green: 0.106, blue: 0.22, alpha: 1)
        secondLabel.font = UIFont(name: "Inter-SemiBold", size: 14)
        let paragraphStyle2 = NSMutableParagraphStyle()
        paragraphStyle2.lineHeightMultiple = 1.18
        secondLabel.attributedText = NSMutableAttributedString(string: "True", attributes: [NSAttributedString.Key.kern: -0.08, NSAttributedString.Key.paragraphStyle: paragraphStyle2])
        
        // container view
        
//        containerView.layer.cornerRadius = 8
        
          containerView.layer.borderWidth = 1
        
        containerView.layer.borderColor = UIColor(red: 0.953, green: 0.957, blue: 0.98, alpha: 1).cgColor

        
        
        
        
        
        
    }
    
    
    func configure() {
        
        
    }
    
    
    
    
    

}
