//
//  EnterInfoViewController.swift
//  DogHairSalon
//
//  Created by SWUCOMPUTER on 2017. 12. 21..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class EnterInfoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textName: UITextField!
    @IBOutlet var textYear: UITextField!
    @IBOutlet var textMonth: UITextField!
    @IBOutlet var textDay: UITextField!
    @IBOutlet var segSex: UISegmentedControl!
    @IBOutlet var segNeutral: UISegmentedControl!
    @IBOutlet var textEtc: UITextField!
    
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func NextPressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Dog", in: context)
        // friend record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        object.setValue(textName.text, forKey: "name")
        object.setValue(textYear.text, forKey: "year")
        object.setValue(textMonth.text, forKey: "month")
        object.setValue(textDay.text, forKey: "day")
        object.setValue(segSex.titleForSegment(at: segSex.selectedSegmentIndex), forKey: "sex")
        object.setValue(segNeutral.titleForSegment(at: segNeutral.selectedSegmentIndex), forKey: "neutralization")

        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    
    /*
    //버튼을 눌러 segue가 작동될 때 다음 씬(IntroViewController)이 push되기 전 넘겨줄 값들을 처리함
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toStyleView"{
            
            let IntroVC = segue.destination as! StyleViewController
            
            let name:String! = nameTextField.text
            let age:String! = ageTextField.text
            let sex:String! = sexSegment.titleForSegment(at: sexSegment.selectedSegmentIndex)
            let phone:String! = phoneTextField.text
            let email:String! = emailTextField.text
            
            
            IntroVC.introName = name
            IntroVC.introAge = age
            IntroVC.introSex = sex
            IntroVC.introPhone = phone
            IntroVC.introEmail = email
            IntroVC.introSms = sms
            
        }
    }
 */

    
    
    
    
  
}
