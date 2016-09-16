//
//  MemesCollectionViewController.swift
//  Image Picker Training
//
//  Created by Ajay Mann on 02/09/16.
//  Copyright © 2016 Ajay Mann. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MemesCollectionViewController: UICollectionViewController {
    var memes : [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        setupCollectionView()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.collectionView?.reloadData()
    }
    
    func setupCollectionView(){
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView!.collectionViewLayout = layout
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.collectionViewCellImageView.backgroundColor = UIColor.darkGrayColor()
        cell.collectionViewCellImageView.image = memes[indexPath.row].memedImage
        print(cell.frame.width)
        print(cell.frame.height)
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let object: AnyObject = storyboard!.instantiateViewControllerWithIdentifier("MemeEditorViewController")
        let detailVC = object as! MemeEditorViewController
        
        detailVC.meme = memes[indexPath.row]
        navigationController!.pushViewController(detailVC, animated: true)
    }


}
