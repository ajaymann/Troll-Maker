//
//  MemeDetailVC.swift
//  Meme Me App
//
//  Created by Ajay Mann on 22/09/16.
//  Copyright © 2016 Ajay Mann. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController, UITextFieldDelegate {
    var meme : Meme!
    var index: Int!

    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButtton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButtton.enabled = false

        if let meme = meme {
            topTextField.text = meme.topText
            bottomTextField.text = meme.bottomText
            imageView.image = meme.originalImage
        }
        setupUI()
        setupTextFields(topTextField)
        setupTextFields(bottomTextField)
        imageView.contentMode = .ScaleAspectFit
    }
    
    func setupUI(){
        if topTextField.text != nil && bottomTextField.text != nil && imageView.image != nil {
            saveButtton.enabled = true
        }
    }
    
    func setupTextFields(textField : UITextField) {
        let memeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.blackColor(),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "Impact", size: 40)!,
            NSStrokeWidthAttributeName : -5.0
        ]
        textField.defaultTextAttributes = memeTextAttributes
        textField.textAlignment = .Center
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveButtonPressed(sender: AnyObject) {
        meme = Meme(topText: topTextField.topText, bottomText: bottomTextField.text, originalImage: <#T##UIImage#>, memedImage: <#T##UIImage#>)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
