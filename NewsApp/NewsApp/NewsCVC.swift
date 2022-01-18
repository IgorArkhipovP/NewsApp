//
//  NewsCVC.swift
//  NewsApp
//
//  Created by Игорь  Архипов on 17.01.2022.
//

import UIKit
import Alamofire
import Kingfisher

//country = us
//apiKey = 2b682086a9b94d598d02712a665d045a

class NewsCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var articles = [Article]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async { [weak self] in
            self?.getArticles()
        }
    
    }
    
    func getArticles() {
        
        let parameters: Parameters = ["country": "us",
                                      "apiKey" : "e9bf73fbbdfa4cee9a30ceb59db4accb"]
        
        AF.request("https://newsapi.org/v2/top-headlines", parameters: parameters).responseData { [weak self] (response) in
            
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
        }

