//
//  NewsViewModel.swift
//  RxSwiftNews
//
//  Created by usr on 2021/8/13.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - NewsViewModel
struct NewsViewModel {
    let news: News
    
    init(_ news: News) {
        self.news = news
    }
}

extension NewsViewModel {
    /* 🌟 回傳 Observable<News 的屬性> */
    var title: Observable<String> {
        return Observable<String>.just(news.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(news.description ?? "")
        //                             description 為 Optional
    }
}

// MARK: - NewsListViewModel
/// **整個主頁面** 的 ViewModel
struct NewsListViewModel {
    let newsViewModels: [NewsViewModel]
}

extension NewsListViewModel {
    /* 傳入 [News]，即會多次呼叫 NewsViewModel 的建構式
     * 生成 [NewsViewModel] */
    init(_ newsAry: [News]) {
        self.newsViewModels = newsAry.compactMap(NewsViewModel.init)
        //                         ⭐️ compactMap 建立不含 nil 的陣列
    }
    
    /* ➡️ 方便 TableView 的 cellForRowAt 函式利用 */
    func newsAt(_ index: Int) -> NewsViewModel {
        return self.newsViewModels[index]
    }
}
