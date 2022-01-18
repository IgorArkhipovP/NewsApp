//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Игорь  Архипов on 17.01.2022.
//

import UIKit
import Kingfisher

class ArticleCell: UICollectionViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headlineLabel.text?.removeAll()
        articleImageView.image = nil
    }
    
    func populate(with article: Article){
        headlineLabel.text = article.headline
        
        if let urlToImage = article.urlToImage {
        let url = URL(string: urlToImage)
        articleImageView.kf.setImage(with: url)
        }
    }
    
}
