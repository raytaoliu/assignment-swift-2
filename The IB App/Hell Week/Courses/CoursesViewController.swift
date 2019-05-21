//
//  CoursesViewController.swift
//  Hell Week
//
//  Created by Student on 2019-05-19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController {
    
    // MARK: - Private properties
    var allCourses: [Course] = []
    var courses: [Course] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var coursesTableView: UITableView!
    
    // MARK: - Unwind segue
    @IBAction func returnToCourses(_ segue: UIStoryboardSegue) { }
}

// MARK: - UIViewController methods

extension CoursesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateDataModels()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCourseInfo" {
            let infoViewController = segue.destination as? InfoViewController
            let course = sender as? Course
            infoViewController?.course = course
        }
    }
}

// MARK: - UITableViewDelegate methods

extension CoursesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showCourseInfo", sender: courses[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource methods

extension CoursesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseTableViewCell", for: indexPath) as? CoursesTableViewCell
        
        cell?.dataSource = courses[indexPath.row]
        return cell ?? CoursesTableViewCell()
    }
}

// MARK: - UITextFieldDelegate methods

extension CoursesViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        courses = allCourses
        coursesTableView.reloadData()
        textField.resignFirstResponder()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        
        getSearchItems(with: updatedString ?? "")
        coursesTableView.reloadData()
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return false
    }
}

// MARK: - Private methods

private extension CoursesViewController {
    func populateDataModels() {
        allCourses = [Course(name: "English Literature", image: #imageLiteral(resourceName: "English"), description: "Analyzing the weirdest, grossest, most horrific pieces of literature ever. Special emphasis on making you repeatedly question the meaning of life!", groupNum: 1, level: "Higher level"),
                   Course(name: "French", image: #imageLiteral(resourceName: "French"), description: "Learning a myriad of ways (over 20) that each verb can be conjugated, and then learning the myriad of exceptions for each rule.", groupNum: 2, level: "Higher level"),
                   Course(name: "Geography", image: #imageLiteral(resourceName: "Geography"), description: "Studying how climate change, terrorism, dictatorships, war, and refugee crises will all contribute to inevitable  extinction of the human race.", groupNum: 3, level: "Standard level"),
                   Course(name: "Chemistry", image: #imageLiteral(resourceName: "Chemistry"), description: "Trying to turn into a proton, so you can repel everything positive.", groupNum: 4, level: "Standard level"),
                   Course(name: "Physics", image: #imageLiteral(resourceName: "Physics"), description: "Having an existential crisis over your insignificance in the universe.", groupNum: 4, level: "Higher level"),
                   Course(name: "Math", image: #imageLiteral(resourceName: "Math"), description: "Reading over your pages and pages of complex equations to find the solution, only to realize that your smart friend found the answer in 2 steps.", groupNum: 5, level: "Higher level"),
                   Course(name: "Theory of Knowledge", image: #imageLiteral(resourceName: "ToK"), description: "Knowing that you know nothing.", groupNum: 0, level: "Core course")]
        
        courses = allCourses
    }
    
    func getSearchItems(with inputString: String) {
        if inputString == "" {
            courses = allCourses
            return
        }
        
        courses = []
        for course in allCourses {
            if course.searchCourse(with: inputString) {
                courses.append(course)
            }
        }
    }
}
