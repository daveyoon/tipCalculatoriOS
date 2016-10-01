//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by David Yoon on 9/24/16.
//  Copyright © 2016 David Yoon. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var DefaultTipValue: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "defaultTipIndex")
        DefaultTipValue.selectedSegmentIndex = defaultTipIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setDefaultTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(DefaultTipValue.selectedSegmentIndex, forKey: "defaultTipIndex")
        defaults.synchronize()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
