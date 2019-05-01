//
//  ArticleTableViewController.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import UIKit

class ArticleTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {    
    
    // MARK: - View Controller
    static let nibName = "ArticleTableViewController"
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataProvider: ArticleDataProvider = ArticleDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        dataProvider.delegate = self
        
        customizeTable()
        dataProvider.refresh()
        
        
    }

   
    
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    func customizeTable(){
        tableView.register(UINib(nibName:ArticleTitleTableViewCell.nibName, bundle:nil), forCellReuseIdentifier: ArticleTitleTableViewCell.nibName)
        
        tableView.register(UINib(nibName:ArticleContentTableViewCell.nibName, bundle:nil), forCellReuseIdentifier: ArticleContentTableViewCell.nibName)
        
        tableView.register(UINib(nibName:CommentTableViewCell.nibName, bundle:nil), forCellReuseIdentifier: CommentTableViewCell.nibName)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return 1
        }else {
            return dataProvider.comments.count
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return UITableViewAutomaticDimension
        }else if indexPath.section == 1{
            return UITableViewAutomaticDimension
        }else {
            return UITableViewAutomaticDimension
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTitleTableViewCell.nibName) as! ArticleTitleTableViewCell
            cell.customize(article: dataProvider.article)
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleContentTableViewCell.nibName) as! ArticleContentTableViewCell
            cell.customize(article: dataProvider.article)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.nibName) as! CommentTableViewCell
            cell.customize(comment: dataProvider.comments[indexPath.row], image: dataProvider.getImage(index: indexPath.row))
            return cell
        }
    }
}
// MARK: - ArticleDataProviderDelegate
extension ArticleTableViewController: ArticleDataProviderDelegate {
    
   
    
    //MARK:
    func articleDataDidLoad() {
        tableView.reloadData()
        
    }
    
    func articleDataHasError(error: String) {
        //TODO:
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
