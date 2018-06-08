//
//  DetailDataArchiveVC.swift
//  SOwithCD
//
//  Created by Станислав Тищенко on 08.06.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

class DetailDataArchiveVC: UIViewController {
    var link: URL?
    var ownerLink: URL?
    var tags: [String]?
    @IBOutlet weak var tagsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Archive Detail Information"
        tagsLabel.text = tags?.joined(separator: ", ")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuestionArchive" {
            let destination = segue.destination as! QuestionArchiveVC
            destination.questionLink = self.link
        }
        if segue.identifier == "toAuthorArchive" {
            let destination = segue.destination as! AuthorArchiveVC
            destination.authorLink = self.ownerLink
        }
    }
}
