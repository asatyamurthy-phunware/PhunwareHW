//
//  DetailViewController.swift
//  PhunwareHW
//
//  Created by Anjana on 3/15/16.
//  Copyright © 2016 Phunware. All rights reserved.
//
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemLocation: UILabel!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    
    var starWarItem:StarWarItem?
    
    override func viewDidLoad() {
        self.itemTitle.text = self.starWarItem?.title
        self.itemDescription.text = self.starWarItem?.itemDescription
        if self.starWarItem?.locationLine1 != nil && self.starWarItem?.locationLine2 != nil{
            self.itemLocation.text = (self.starWarItem?.locationLine1)! + ", " + (self.starWarItem?.locationLine2)!
        }
        else if self.starWarItem?.locationLine1 != nil{
            self.itemLocation.text = self.starWarItem?.locationLine1!
        }else if self.starWarItem?.locationLine2 != nil{
            self.itemLocation.text = self.starWarItem?.locationLine2!
        }
        else{
            self.itemLocation.text = ""
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        let date = dateFormatter.dateFromString(self.starWarItem!.date!)
        let newdateFormatter = NSDateFormatter()
        newdateFormatter.dateFormat = "MMM dd, yyyy 'at' hh.mm a"
        self.date.text = newdateFormatter.stringFromDate(date!)
        
        let URL = NSURL(string: self.starWarItem!.image!)!
        let placeholderImage = UIImage(named: "placeholder.jpg")!
        self.headerImage.af_setImageWithURL(URL,placeholderImage: placeholderImage,filter: nil,imageTransition: .CrossDissolve(0.2))
    }
}
