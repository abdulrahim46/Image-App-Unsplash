//
//  LikeImagesCell.swift
//  ImageAppUnsplash
//
//  Created by Abdul chaudhary on 10/10/20.
//

import UIKit

class LikeImagesCell: UICollectionViewCell {
    

    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(images: LikeImages) {
        
        imageLabel.text = images.userName
        
        if let url = URL(string: images.imageUrl) {
            imageView.af.setImage(withURL: url)
        }
    }
}
