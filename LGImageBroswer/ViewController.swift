//
//  ViewController.swift
//  LGImageBroswer
//
//  Created by ligang on 16/1/13.
//  Copyright © 2016年 L&G. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var picturesArray = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.preparePictures()
        
        let cellW = (self.view.frame.size.width - 10) / 4
        let layOut = UICollectionViewFlowLayout()
        layOut.itemSize = CGSizeMake(cellW, cellW)
        layOut.minimumLineSpacing = 2
        layOut.minimumInteritemSpacing = 0
        layOut.scrollDirection = .Vertical
        
        let collectionView = UICollectionView.init(frame: CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height), collectionViewLayout: layOut)
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.pagingEnabled = true
        collectionView.bounces = true
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier:"cell")

        self.view.addSubview(collectionView)
    }
    func preparePictures() {
        for var i = 0; i < 6; i++ {
            let image:UIImage = UIImage(named:NSString().stringByAppendingFormat("broswerPic%d.jpg", i) as String)!
            self.picturesArray.append(image)
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.clearColor()
        cell.backgroundView = UIImageView(image: self.picturesArray[indexPath.item] as UIImage)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.picturesArray.count
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let imageBroswer = LGImageBroswer.init()
        imageBroswer.picturesArray = self.picturesArray
        imageBroswer.currentPageIndex = indexPath.item
        self.presentViewController(imageBroswer, animated: true) { () -> Void in
        }
    }
}

