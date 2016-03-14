//
//  ViewController.swift
//  PhunwareHW
//
//  Created by Anjana on 3/9/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

import UIKit
import AlamofireImage

class ListViewController: UIViewController, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
@IBOutlet weak var collectionView: UICollectionView!
    var items = [StarWarItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkClient.getFeedItems({ (result) -> Void in
            self.items = result;
            self.collectionView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:ListItemCell = collectionView.dequeueReusableCellWithReuseIdentifier("ListItem", forIndexPath: indexPath) as! ListItemCell;
        let item:StarWarItem = items[indexPath.row]
        
        cell.title.text = item.title;
        
        let URL = NSURL(string: item.image!)!
        let placeholderImage = UIImage(named: "placeholder.jpg")!
        cell.backgroundImage.af_setImageWithURL(URL,placeholderImage: placeholderImage,filter: nil,imageTransition: .CrossDissolve(0.2))
        
        if item.locationLine1 != nil && item.locationLine2 != nil{
            cell.location.text = item.locationLine1! + ", " + item.locationLine2!
        }
        else if item.locationLine1 != nil{
            cell.location.text = item.locationLine1!
        }else if item.locationLine2 != nil{
            cell.location.text = item.locationLine2!     
        }
        else{
            cell.location.text = ""
        }
        
        cell.itemDescription.text = item.itemDescription
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        let date = dateFormatter.dateFromString(item.date!)
        let newdateFormatter = NSDateFormatter()
        newdateFormatter.dateFormat = "MMM dd, yyyy 'at' hh.mm a"
        cell.date.text = newdateFormatter.stringFromDate(date!)
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            let width:CGFloat = UIScreen.mainScreen().bounds.size.width/2;
            let half:CGFloat = CGFloat(self.items.count/2)
            let height:CGFloat = UIScreen.mainScreen().bounds.size.height/half
            return CGSizeMake(width, height)
        }
        else{
            return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 150)
        }
    }
    
    // MARK: Rotation related
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    

}

