//
//  Article.swift
//  RxSwiftNews
//
//  Created by usr on 2021/8/10.
//

import Foundation

struct News: Decodable {
    let title: String
    let description: String?
}

struct NewsAPIData: Decodable {
    let news: [News]
}

extension NewsAPIData {
    static var all: Resource<NewsAPIData> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=bbc-news&conutry=tw&apiKey=0054b9c0af91488da4577c1bf6668b34")!
        return Resource(url: url)
    }()
}
