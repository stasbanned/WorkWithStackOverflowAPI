//
//  DetailDataVC.swift
//  SOwithCD
//
//  Created by Станислав Тищенко on 07.06.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit

class DetailDataVC: UIViewController {
    var questionLink: URL?
    var authorLink: URL?
    var tags: [String]?

    @IBOutlet weak var tagsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail infromtaion"
        tagsLabel.text = tags?.joined(separator: ", ")

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuestion" {
            let destination = segue.destination as! QuestionVC
            destination.questionLink = self.questionLink
        }
        if segue.identifier == "toAuthor" {
            let destination = segue.destination as! AuthorVC
            destination.authorLink = self.authorLink
        }
    }

}
