//
//  ViewController.swift
//  GetQiitaAPI
//
//  Created by Koki Kubota on 2020/07/05.
//  Copyright © 2020 Koki Kubota. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var articles: [[String: String?]] = [] // 記事を入れるプロパティを定義

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getArticles()
    }
    
    func getArticles() {
        AF.request("https://qiita.com/api/v2/items", method: .get)
        .responseJSON { response in
            guard let object = response.value else {
                return
            }
            let json = JSON(object)
            json.forEach { (_, json) in
                let article: [String: String?] = [
                    "title": json["title"].string,
                    "userId": json["user"]["id"].string,
                    "url": json["url"].string
                ] // 1つの記事を表す辞書型を作る
                self.articles.append(article) // 配列に入れる
            }
            print(self.articles) // 全ての記事が保存出来たら配列を確認
        }
    }


}

