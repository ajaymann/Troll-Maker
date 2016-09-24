//
//  MemeDetailVC.swift
//  Meme Me App
//
//  Created by Ajay Mann on 22/09/16.
//  Copyright © 2016 Ajay Mann. All rights reserved.
//

import UIKit

class MemeDetailVC: UIViewController {

    var meme : Meme!
    @IBOutlet weak var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let meme = meme {
            imageView.image = meme.memedImage
        }
        imageView.contentMode = .ScaleAspectFit
    }

    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
