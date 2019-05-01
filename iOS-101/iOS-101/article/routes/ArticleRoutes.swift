//
//  ArticleRoutes.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import Foundation
import UIKit


class ArticleRoutes {
    static func showArticle(article: ArticleModel,fromVC: UIViewController){
        let articleVC = UIStoryboard(name: "Article", bundle: nil).instantiateViewController(withIdentifier: ArticleTableViewController.nibName) as! ArticleTableViewController
        
        articleVC.dataProvider.article = article
        
        fromVC.navigationController?.pushViewController(articleVC, animated: true)
    }
   
}
