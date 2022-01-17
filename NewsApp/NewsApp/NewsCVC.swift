//
//  NewsCVC.swift
//  NewsApp
//
//  Created by Игорь  Архипов on 17.01.2022.
//

import UIKit

class NewsCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = 240
        let width: CGFloat = (collectionView.frame.width / 2) - 2
        
        let size = CGSize(width: width, height: height)
        
        return size
    }
    
    
}
