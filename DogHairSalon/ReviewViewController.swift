//
//  ReviewViewController.swift
//  DogHairSalon
//
//  Created by SWUCOMPUTER on 2017. 12. 21..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//


import UIKit
import CoreData

class ReviewViewController: UIViewController {
   
    
    @IBOutlet var dogName: UILabel!
    @IBOutlet var dogYear: UILabel!
    @IBOutlet var dogMonth: UILabel!
    @IBOutlet var dogDay: UILabel!
    @IBOutlet var dogSex: UILabel!
    @IBOutlet var dogNeutralization: UILabel!
    @IBOutlet var dogWeight: UILabel!
    
    

    var detailDog: NSManagedObject?
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let detail = detailDog {
            dogName.text = detail.value(forKey: "name") as? String
            dogYear.text = detail.value(forKey: "year") as? String
             dogMonth.text = detail.value(forKey: "month") as? String
             dogDay.text = detail.value(forKey: "day") as? String
            dogSex.text = detail.value(forKey: "sex") as? String
            dogNeutralization.text = detail.value(forKey: "neutralization") as? String
            dogWeight.text = detail.value(forKey: "weight") as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    
    /*
    
    // View가 보여질 때 자료를 Dog에서 가져오도록 한다
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let context = self.getContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Dog")
        do {
            dogInfo = try context.fetch(fetchRequest) //가져옴
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        for i in 0 ..< dogInfo.count{
            dogName.text = dogInfo[i].value(forKey: "name") as? String
        
        }
    }
 */

        
        }
 
 

        
        
        
    
    
    



