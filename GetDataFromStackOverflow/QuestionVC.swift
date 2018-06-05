//
//  QuestionVC.swift
//  GetDataFromStackOverflow
//
//  Created by Станислав Тищенко on 05.06.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    var questionLink: URL?
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Question"
        let request = URLRequest(url: questionLink!)
        webView.loadRequest(request)
    }
}
