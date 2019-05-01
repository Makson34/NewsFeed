//
//  AllArticlesViewController.swift
//  iOS-101
//
//  Created by 1 on 26.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import UIKit

class AllArticlesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate ,AllArticlesDataProviderDelegate{
   
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataProvider:AllArticlesDataProvider = AllArticlesDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        dataProvider.delegate = self
        customizeTableView()
        
        dataProvider.loadArticles()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizeTableView(){
        tableView.register(UINib(nibName:ArticleTableViewCell.nibName, bundle:nil), forCellReuseIdentifier: ArticleTableViewCell.nibName)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.nibName) as! ArticleTableViewCell
        cell.customize(article: dataProvider.articles[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // performSegue(withIdentifier: "toArticle", sender: nil)
        ArticleRoutes.showArticle(article: dataProvider.articles[indexPath.row],fromVC: self)
    }
    //MARK: - AllArticlesDataProviderDelegate
    func articlesDataLoaded() {
        tableView.reloadData()
    }
    
    func articlesDataHasError(error: String) {
        //TODO:
    }
    
}
