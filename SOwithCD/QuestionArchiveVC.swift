//
//  QuestionArchiveVC.swift
//  SOwithCD
//
//  Created by Станислав Тищенко on 08.06.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

class QuestionArchiveVC: UIViewController {
    var questionLink: URL?
    @IBOutlet weak var wwebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Archive Question"
        let request = URLRequest(url: questionLink!)
        wwebView.loadRequest(request)
    }
}
