//
//  CreateController.swift
//  RealTimeGolf
//
//  Created by Ethan Keiser on 3/11/23.
//

import UIKit
protocol CreateDelegate: NSObject {
    func didCreate(name: String, date: Date)
}
class CreateController: UIViewController {
    var delegate : CreateDelegate?
    
    @IBOutlet weak var matchNameLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker?.date = Date()
        datePicker?.locale = .current
        datePicker?.preferredDatePickerStyle = .compact

    }
    @IBAction func createButton(_ sender: Any) {
        guard let name = matchNameLabel.text else {
            return
        }
        delegate?.didCreate(name: name, date: datePicker.date)
        self.dismiss(animated: true)
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