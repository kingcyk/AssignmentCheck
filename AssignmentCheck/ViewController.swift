//
//  ViewController.swift
//  AssignmentCheck
//
//  Created by kingcyk on 22/12/2016.
//  Copyright © 2016 kingcyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nowSelected: UILabel!
    @IBOutlet var progressSelected: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var changeButton: UIButton!
    var doneCount = 0
    var courseSelected = course()

    override func viewDidLoad() {
        super.viewDidLoad()
        if courseMgr.selected > -1 {
            courseSelected = courseMgr.courses[courseMgr.selected]
            nowSelected.text = courseSelected.name
            progressSelected.text = "\(courseSelected.finish) / \(courseSelected.count)"
            if courseSelected.count == 0 {
                progressBar.progress = 0
            } else {
                progressBar.progress = (Float)(courseSelected.finish) / (Float)(courseSelected.count)
            }
            stepper.value = Double(courseSelected.finish)
            stepper.maximumValue = Double(courseSelected.count)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if courseMgr.selected > -1 {
            courseSelected = courseMgr.courses[courseMgr.selected]
            nowSelected.text = courseSelected.name
            progressSelected.text = "\(courseSelected.finish) / \(courseSelected.count)"
            if courseSelected.count == 0 {
                progressBar.progress = 0
            } else {
                progressBar.progress = (Float)(courseSelected.finish) / (Float)(courseSelected.count)
            }
            stepper.value = Double(courseSelected.finish)
            stepper.maximumValue = Double(courseSelected.count)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stepperValueChanged() {
        courseSelected.finish = Int(stepper.value)
        progressBar.progress = (Float)(courseSelected.finish) / (Float)(courseSelected.count)
        progressSelected.text = "\(courseSelected.finish) / \(courseSelected.count)"
    }
}

