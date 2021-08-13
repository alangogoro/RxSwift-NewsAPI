//
//  NewsTableViewController.swift
//  RxSwiftNews
//
//  Created by usr on 2021/8/10.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    private var news = [News]()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    private func populateNews() {
        //let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&conutry=tw&apiKey=0054b9c0af91488da4577c1bf6668b34")!
        //let resource = Resource<ArticleList>(url: url)
        
        /* ➡️ 取得解析完成的 Observable<NewsAPIData?>
         * 因為是 Observable，可以訂閱它捕捉結果 */
        URLRequest.load(resource: NewsAPIData.all)
            .subscribe(onNext: { [weak self] result in
                self?.news = result.articles
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell does not exists") }
        cell.titleLabel.text = news[indexPath.row].title
        cell.descriptionLabel.text = news[indexPath.row].description
        return cell
    }
}
