//
//  NewsCVC.swift
//  NewsApp
//
//  Created by Игорь  Архипов on 17.01.2022.
//

import UIKit

class NewsCVC: UICollectionViewController {
    
    var articles = [Article(headline: "this is news"),
                    Article(headline: "this is also news"),
                    Article(headline: "this is super uper great")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else { return UICollectionViewCell() }
        
        let article = articles[indexPath.item]
        cell.populate(with: article)
        
        return cell
    }
}
