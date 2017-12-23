//
//  BranchViewController.swift
//  DogHairSalon
//
//  Created by SWUCOMPUTER on 2017. 12. 21..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class BranchViewController: UIViewController {

    @IBOutlet var pickerDateTime: UIDatePicker!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    //지점을 선택하는 버튼을 클릭할 시 Core Data Reserve에 위치를 저장
    @IBAction func btnBranch(_ sender: UIButton) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Reserve", in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        let buttonLabel = sender.titleLabel?.text
        object.setValue(buttonLabel, forKey: "location")
    }
    
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Reserve", in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"
        //dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"

        
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        
        let dateString: String = dateFormatter.string(from: self.pickerDateTime.date)
        object.setValue(dateString, forKey: "reserveDate")
        
    }

    

    

}
