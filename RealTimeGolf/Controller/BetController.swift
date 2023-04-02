//
//  BetController.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 4/1/23.
//

import UIKit

class BetController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var betTextField: UITextField!
    var nextButtonPressed : (()->())?
    override func viewDidLoad() {
        super.viewDidLoad()
        betTextField.keyboardType = .numberPad
        betTextField.returnKeyType = .done
        addDoneButtonOnKeyboard()
        // Do any additional setup after loading the view.
    }
    
    func addDoneButtonOnKeyboard()
    {
        var doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = .default

        var flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        var done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))

        var items = NSMutableArray()
        items.add(flexSpace)
        items.add(done)

        doneToolbar.items = items as! [UIBarButtonItem]
        doneToolbar.sizeToFit()

        self.betTextField.inputAccessoryView = doneToolbar

    }

    @objc func doneButtonAction()
    {
        self.betTextField.resignFirstResponder()
    }
    

    @IBAction func nextButton(_ sender: Any) {
        nextButtonPressed?()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(false)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
