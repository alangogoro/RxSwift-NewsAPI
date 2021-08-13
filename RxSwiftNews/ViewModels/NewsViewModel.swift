//
//  NewsViewModel.swift
//  RxSwiftNews
//
//  Created by usr on 2021/8/13.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - NewsListViewModel
/// **整個主頁面** 的 ViewModel
struct NewsListViewModel {
    let newsViewModels: [NewsViewModel]
}

extension NewsListViewModel {
    /* 在建構式傳入參數：取得的資料陣列 */
    init(_ newsAry: [News]) {
        self.newsViewModels = newsAry.compactMap(NewsViewModel.init)
    }
    
    /* ➡️ 方便 TableView 的 cellForRowAt 函式利用 */
    func newsAt(_ index: Int) -> NewsViewModel {
        return self.newsViewModels[index]
    }
}

// MARK: - NewsViewModel
struct NewsViewModel {
    let news: News
    
    init(_ news: News) {
        self.news = news
    }
}

extension NewsViewModel {
    /* ➡️ 回傳 Observable<String> */
    var title: Observable<String> {
        return Observable<String>.just(news.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(news.description ?? "")
    }
}
