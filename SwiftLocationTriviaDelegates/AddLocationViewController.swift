//
//  AddLocationViewController.swift
//  SwiftLocationTriviaDelegates
//
//  Created by Haaris Muneer on 7/14/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {
    
    weak var delegate: AddLocationViewControllerDelegate?
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        delegate?.addLocationViewControllerDidCancel(self)
    }
    
    @IBAction func submitButtonTapped(sender: AnyObject) {
        if let text = locationTextField.text {
            delegate?.addLocationViewController(self, didAddLocationNamed: text)
        }
    }
    @IBAction func locationTextFieldEdited(sender: AnyObject) {
        if let text = locationTextField.text, delegate = delegate {
            if !(delegate.addLocationViewController(self, shouldAllowLocationNamed: text)) {
                saveButton.enabled = false
            }
            else { saveButton.enabled = true }
        }
    }

}

protocol AddLocationViewControllerDelegate: class {
    func addLocationViewControllerDidCancel(viewController: AddLocationViewController)
    
    func addLocationViewController(viewController: AddLocationViewController, shouldAllowLocationNamed name: String) -> Bool
    
    func addLocationViewController(viewController: AddLocationViewController, didAddLocationNamed name: String)
}
