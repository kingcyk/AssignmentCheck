//
//  TodayViewController.swift
//  TodayWidget
//
//  Created by kingcyk on 23/12/2016.
//  Copyright © 2016 kingcyk. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var desc: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var stepper: UIStepper!
    var courseSelected = course()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        if #available(iOSApplicationExtension 10, *) {
            self.extensionContext?.widgetLargestAvailableDisplayMode = .compact
        }
        if courseMgr.selected > -1 {
            courseSelected = courseMgr.courses[courseMgr.selected]
            desc.text = courseSelected.name + " : \(courseSelected.finish) / \(courseSelected.count)"
            progressBar.progress = Float(courseSelected.finish) / Float(courseSelected.count)
            stepper.maximumValue = Double(courseSelected.count)
            stepper.value = Double(courseSelected.finish)
        } else {
            desc.text = "当前选择：无"
            progressBar.progress = 0
            stepper.isEnabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        if courseMgr.selected > -1 {
            courseSelected = courseMgr.courses[courseMgr.selected]
            desc.text = courseSelected.name + " : \(courseSelected.finish) / \(courseSelected.count)"
            progressBar.progress = Float(courseSelected.finish) / Float(courseSelected.count)
            stepper.maximumValue = Double(courseSelected.count)
            stepper.value = Double(courseSelected.finish)
        } else {
            desc.text = "当前选择：无"
            progressBar.progress = 0
            stepper.isEnabled = false
        }
        completionHandler(NCUpdateResult.newData)
    }
    
    @IBAction func stepperValueChanged() {
        courseSelected.finish = Int(stepper.value)
        progressBar.progress = (Float)(courseSelected.finish) / (Float)(courseSelected.count)
        desc.text = courseSelected.name + " : \(courseSelected.finish) / \(courseSelected.count)"
    }
    
}
