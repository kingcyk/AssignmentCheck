//
//  courseList.swift
//  AssignmentCheck
//
//  Created by kingcyk on 22/12/2016.
//  Copyright © 2016 kingcyk. All rights reserved.
//

import UIKit

class CourseList: UIViewController {
    
    @IBOutlet var list: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        list.reloadData()
    }
}

extension CourseList: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        courseMgr.selected = indexPath.row
        list.deselectRow(at: indexPath, animated: true)
        //self.show(ViewController(), sender: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ViewController
        self.show(vc, sender: nil)
    }
}

extension CourseList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseMgr.courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "course")
        cell.textLabel?.text = courseMgr.courses[indexPath.row].name
        return cell
    }
}
