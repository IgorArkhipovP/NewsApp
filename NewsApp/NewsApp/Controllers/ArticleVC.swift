//
//  ArticleVC.swift
//  NewsApp
//
//  Created by Игорь  Архипов on 18.01.2022.
//

import UIKit
import WebKit

class ArticleVC: UIViewController {
    
    @IBOutlet weak var articleWebView: WKWebView!
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let articleURL = article?.url,
           let url = URL(string: articleURL){
            let request = URLRequest(url: url)
            articleWebView.load(request)
        }

    }
    


}
