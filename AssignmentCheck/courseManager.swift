//
//  courseManager.swift
//  AssignmentCheck
//
//  Created by kingcyk on 22/12/2016.
//  Copyright © 2016 kingcyk. All rights reserved.
//

import UIKit

var courseMgr: CourseManager = CourseManager()

struct course {
    
    var name: String = "你的课"
    var count: Int = 0 //学神不用刷题
    var finish: Int = 0
    
}

class CourseManager: NSObject {
    
    var courses = [course]()
    var selected: Int = -1
    
    func addCourse(name: String, count: Int) {
        courses.append(course(name: name, count: count, finish: 0))
    }
    
}
