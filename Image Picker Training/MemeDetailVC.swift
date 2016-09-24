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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
