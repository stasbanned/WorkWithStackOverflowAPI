//
//  ViewController.swift
//  SOwithCD
//
//  Created by Станислав Тищенко on 07.06.2018.
//  Copyright © 2018 Станислав Тищенко. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var getDataButton: UIButton!
    var dataToNextScreen = [Items]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let currentTime = Date()
        let currentTimeInSeconds = Int(currentTime.timeIntervalSince1970 + 10800)
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentTime)
        let minutes = calendar.component(.minute, from: currentTime)
        let seconds = calendar.component(.second, from: currentTime)
        let todayMidnight = currentTimeInSeconds - hour * 3600 + minutes * 60 + seconds
        let param = ["fromdate": todayMidnight, "todate": currentTimeInSeconds, "key": "7DSNIn7QrxoUMbO62ggDeg((", "tagged":"swift4"] as [String : Any]

        request("https://api.stackexchange.com/2.2/questions/no-answers?order=desc&sort=activity&site=stackoverflow&filter=!WaV5.9c(PIZ0s2P3DZdZXxN5mRC0vshdCL85j.4E-f)rmwJ()KTr6vJI762CKo2i_vs3*iqx.1LWjaixTj5PP", parameters: param).responseJSON { response in
            let inputData = response.data
            let decoder = JSONDecoder()
            let stat = try! decoder.decode(Stat.self, from: inputData!)
            self.dataToNextScreen = stat.items
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.getDataButton.isEnabled = true
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTableWithData" {
            let destination = segue.destination as! DataTableVC
            destination.arrayWithData = dataToNextScreen
        }
    }
}
