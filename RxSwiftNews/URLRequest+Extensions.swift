//
//  URLRequest+Extensions.swift
//  RxSwiftNews
//
//  Created by usr on 2021/8/10.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    static func load<T>(resource: Resource<T>) -> Observable<T?> {
        
        /* Observable.from()
         * 轉換陣列成 Observable 的序列 */
        return Observable.from([resource.url])
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                /* ⭐️ RxSwift 擴充的承接 URLSession 回傳資料的類型 ⭐️
                 *                      .rx.data */
                return URLSession.shared.rx.data(request: request)
            }.map { data -> T? in
                /* ➡️ 經過 JSONDecoder 解析，有可能為 nil
                 * 因此回傳設為 T? */
                return try? JSONDecoder().decode(T.self, from: data)
            }.asObservable()
        
    }
}
