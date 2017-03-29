//
//  ViewController.swift
//  myShoppingList
//
//  Created by LiJing on 2/12/17.
//  Copyright © 2017 DePaul University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var textFields: [UITextField]!
    
   
    @IBAction func backgroundEnd(_ sender: UIControl) {
        for tf in textFields{
            tf.resignFirstResponder()
        }
    }
    
    @IBAction func EditEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    @IBAction func newList(_ sender: UIButton) {
        textView.text="No item"
    }
    @IBAction func newItem(_ sender: UIButton) {
        for tf in textFields{
            tf.text=""
        }
    }
    
    func alert(on info: String){
        let title="Input error"
        let message=info
        let alertController=UIAlertController(title:title, message:message, preferredStyle: .alert)
        let cancelAction=UIAlertAction(title: "Got it", style: .cancel, handler:nil)
        alertController.addAction(cancelAction)
        present(alertController, animated:true, completion: nil)
    }
    
    @IBAction func add(_ sender: UIButton) {
        if let getItem=textFields[0].text{
            if getItem==""{
                 alert(on: "invalid description: you should type in an item description here!")
            }else{
           
                if let getQuan=textFields[1].text{
                    if textFields[1].text==""{
                        alert(on: "invalid quantity: you should type in the quantity of item here!")
                    }else if let numofInt=Int(getQuan){
                        if let num=Double(getQuan){
                            if Double(numofInt) == num {
                                if textView.text=="No item"{
                                    textView.text="\(getQuan) * \(getItem)\n"
                                }else{
                                    textView.text=textView.text+"\(getQuan) * \(getItem)\n"
                                }
                            }else{
                                alert(on: "invalid quantity: the quantity must be an integer!")
                            }
                        }
                    }else{
                        alert(on: "invalid quantity: the quantity must be an integer number!")
                    }
                    
                    
                    
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

