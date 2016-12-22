//
//  courseEdit.swift
//  AssignmentCheck
//
//  Created by kingcyk on 22/12/2016.
//  Copyright © 2016 kingcyk. All rights reserved.
//

import UIKit

class CourseEdit: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var countField: UITextField!
    @IBOutlet var done: UIButton!
    
    @IBAction func finishEditing() {
        let courseName = nameField.text!
        let courseCount = (Int)(countField.text!)!
        courseMgr.addCourse(name: courseName, count: courseCount)
        self.view.endEditing(true)
        nameField.text = ""
        countField.text = ""
    }
    
    @IBAction func cancelEditing() {
        nameField.text = ""
        countField.text = ""
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension CourseEdit: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
