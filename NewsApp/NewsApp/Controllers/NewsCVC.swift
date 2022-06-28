//
//  NewsCVC.swift
//  NewsApp
//
//  Created by Игорь  Архипов on 17.01.2022.
//

import UIKit
import Alamofire
import Kingfisher

class NewsCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var articles = [Article]()
    var toArticleVC = "toArticleVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async { [weak self] in
            self?.getArticles()
        }
        
    }
    
    func getArticles() {
        
        let baseURL = "https://newsapi.org"
        let path = "/v2/top-headlines"
        
        let parameters: Parameters = ["country": "ru",
                                      "apiKey" : "e9bf73fbbdfa4cee9a30ceb59db4accb"]
        
        AF.request(baseURL + path, parameters: parameters).responseData { [weak self] (response) in
            
            guard let data = response.data else { return }
            
            do {
                //                let json = try JSONSerialization.jsonObject(with: data, options: [])
                //                print(json)
                
                let topHeadlinesResponse = try JSONDecoder().decode(TopHeadlinesResponse.self, from: data)
                self?.articles = topHeadlinesResponse.articles
                self?.collectionView?.reloadData()
                
            } catch {
                print(error)
            }
            
        }
        
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = articles[indexPath.item]
        performSegue(withIdentifier: toArticleVC, sender: article)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let articleVC = segue.destination as? ArticleVC,
           let article = sender as? Article {
            articleVC.article = article
        }
        
    }
}

