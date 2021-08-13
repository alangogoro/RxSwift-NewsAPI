//
//  NewsViewModel.swift
//  RxSwiftNews
//
//  Created by usr on 2021/8/13.
//

import Foundation
import RxSwift
import RxCocoa

struct NewsListViewModel {
    let newsViewModels: [NewsViewModel]
}

extension NewsListViewModel {
    init(_ newsList: [News]) {
        self.newsViewModels = newsList.compactMap(NewsViewModel.init)
    }
    
    func newsAt(_ index: Int) -> NewsViewModel {
        return self.newsViewModels[index]
    }
}

struct NewsViewModel {
    let news: News
    
    init(_ news: News) {
        self.news = news
    }
}

extension NewsViewModel {
    var title: Observable<String> {
        return Observable<String>.just(news.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(news.description ?? "")
    }
}
