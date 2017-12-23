//
//  StyleViewController.swift
//  DogHairSalon
//
//  Created by SWUCOMPUTER on 2017. 12. 21..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//


import UIKit
import CoreData

class StyleViewController: UIViewController {
    
    @IBOutlet var styleAll: UIButton!
    @IBOutlet var stylePart: UIButton!
    @IBOutlet var styleTeddy: UIButton!
    @IBOutlet var styleBroccoli: UIButton!
    @IBOutlet var styleFull: UIButton!
    @IBOutlet var styleSummer: UIButton!
    
    
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    

    // 버튼 선택시 Core Data Reserve에 예약한 스타일과 가격을 저장
    @IBAction func btnStyle(_ sender: UIButton) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Reserve", in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        if sender == styleAll{
            object.setValue("styleAll", forKey: "cutType")
            object.setValue("30,000", forKey: "price")
        }else if sender == stylePart{
             object.setValue("stylePart", forKey: "cutType")
             object.setValue("15,000", forKey: "price")
        }else if sender == styleTeddy{
            object.setValue("styleTeddy", forKey: "cutType")
            object.setValue("50,000", forKey: "price")
        }else if sender == styleBroccoli{
            object.setValue("styleBroccoli", forKey: "cutType")
            object.setValue("50,000", forKey: "price")
        }else if sender == styleFull{
            object.setValue("styleFull", forKey: "cutType")
            object.setValue("40,000", forKey: "price")
        }else if sender == styleSummer{
            object.setValue("styleSummer", forKey: "cutType")
            object.setValue("30,000", forKey: "price")
        }
        
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
