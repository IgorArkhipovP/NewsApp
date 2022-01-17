//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Игорь  Архипов on 17.01.2022.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    
    func populate(with article: Article){
        headlineLabel.text = article.headline
    }
    
}
