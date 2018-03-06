//
//  ViewController.swift
//  walnutcreek
//
//  Created by Lewis Black on 03/03/2018.
//  Copyright © 2018 Lewis Black. All rights reserved.
//

import UIKit

//
//  GameVC.swift
//  Celebreak
//
//  Created by Lewis Black on 15/02/2017.
//  Copyright © 2017 Lewis Black. All rights reserved.
//

import UIKit
import MapKit
import UserNotifications


class MessageVC: UIViewController, UNUserNotificationCenterDelegate {
    
    var point:Point!
    
    var messages:[Message] = []
    @IBOutlet weak var infoV: UIView!
    @IBOutlet weak var mapV: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageInputTextView: UITextView!
    
    var placeholderText = "Type a message"
    
    let id = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = point.name

        self.label1.text = point.address
        self.label2.text = point.type
        self.label3.text = point.status

            ImageDownloader.downloadImageAndShow(url: point.url, setAs: imageView)

        
//        let mess = Message(userName: "Jim Jefferson", message: "Hi guys, I'm your local councillor for housing. If you have any questions about this development you can ask them here.", userID: "Jim")
//        
//        FirPickUp.write(message: mess, inGame: id)
        
        NotificationCenter.default.addObserver(self, selector: #selector(MessageVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MessageVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        FirPickUp.observeMessagesOfGame(id: id) { (message) in
            self.messages.append(message)
            self.show(message: message)
        }
        
        tableView.delegate = self
        
    }
    
    @IBAction func onControlPressed(_ sender: Any) {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            infoV.isHidden = true
            mapV.isHidden = false
        default:
            infoV.isHidden = false
            mapV.isHidden = true
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initiateUI()
    }
    
  
    
    private func initiateUI(){
        
        messageInputTextView.layer.borderColor = UIColor.gray.cgColor
        messageInputTextView.layer.borderWidth = 0.5;
        
        messageInputTextView.text = placeholderText
        messageInputTextView.textColor = UIColor.lightGray
        tableView.reloadData()

    }
    
   
    
}




extension MessageVC {
    
    
    
    
    @IBAction func sendMessagePressed(_ sender: Any) {
        
      
                if let messageText = messageInputTextView.text  {
                    if messageText.count > 0  && messageText != placeholderText {
                        if !messageInputTextView.text.trimmingCharacters(in: .whitespaces).isEmpty {
                            
                            let message = Message(userName: "Mary Tawfik", message: messageText, userID: "Lewis")
                            add(message: message)
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            messageInputTextView.text = ""
                        }
                    }
                }
        
    }
    
    private func add(message:Message){
       // self.messages.append(message:Message)
        FirPickUp.write(message: message, inGame: id)
      //  show(message: message)
    }
    
    private func show(message:Message){
        self.tableView.reloadData()
        let numberOfSections = self.tableView.numberOfSections
        let numberOfRows = self.tableView.numberOfRows(inSection: numberOfSections-1)
        
        if numberOfRows > 0 {
            let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    
}


extension MessageVC: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        
        let set = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-/:;()@$.,!€&\"?'#%_ñçéá ").inverted
        
        let compSepByCharInSet = text.components(separatedBy: set)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return text == numberFiltered && numberOfChars < 400
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = UIColor.lightGray
        }
    }
}


//extension MessageVC {
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            self.view.layoutIfNeeded()
//        }
//
//    }
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//             self.view.layoutIfNeeded()
//
//    }
//}

extension MessageVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let message = messages[indexPath.row]
            
            if message.userID == "Lewis" {
                let cell: UserMessageCell = tableView.dequeueReusableCell(withIdentifier: "UsersMessage") as! UserMessageCell
                cell.userName.text = message.userName.capitalized
                cell.message.text = message.message
                return cell
            } else {
                let cell:MessageCell = tableView.dequeueReusableCell(withIdentifier: "Message") as! MessageCell
                cell.userName.text = message.userName.capitalized
                cell.message.text = message.message
                cell.message.sizeToFit()
                
                return cell
            }
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
}

extension MessageVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let newLength = text.utf16.count + string.utf16.count - range.length
        
        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ").inverted
        return string.rangeOfCharacter(from: set) == nil && newLength < 18
    }
}






