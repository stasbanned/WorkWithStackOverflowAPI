//
//  AuthorArchiveVC.swift
//  SOwithCD
//
//  Created by Станислав Тищенко on 08.06.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

class AuthorArchiveVC: UIViewController {
    var authorLink: URL?
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Archive Author"
        let request = URLRequest(url: authorLink!)
        webView.loadRequest(request)
    }
}
