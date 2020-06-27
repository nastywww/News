//
// Created by Настя on 26.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import Foundation

class NewsApiServiceMock: NewsApiServiceProtocol{

    var articles: [ArticleAPIResponse]
    var sourceChannel: [SourceChannel]

    init(articles: [ArticleAPIResponse], sourceChannel: [SourceChannel]){
        self.articles = articles
        self.sourceChannel = sourceChannel
    }

    func getArticles(searchString: String, completion: @escaping ([ArticleAPIResponse]) -> ()) {
         completion(articles)
    }

    func getFavouriteArticles(domains: String, completion: @escaping ([ArticleAPIResponse]) -> ()) {
        completion(articles)
    }

    func getChannels(completion: @escaping ([SourceChannel]) -> ()) {
        completion(sourceChannel)
    }


}