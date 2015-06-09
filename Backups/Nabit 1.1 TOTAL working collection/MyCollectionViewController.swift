//
//  MyCollectionViewController.swift
//  
//
//  Created by Michael Manchakowski on 2015-06-04.
//
//

import UIKit

let reuseIdentifier = "MyCell"

class MyCollectionViewController: UICollectionViewController,
UICollectionViewDataSource, UICollectionViewDelegate {
    
    var images = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Do any additional setup after loading the view.
        //images = ["AlaniaSquare.jpg",
        //    "CRAIGHUH.jpg",
        //    "ONPAB.jpg",
        //    "ONPAC.jpg"]
        
        var newPhoto = Photo(name: "Craig", filename:"AlaniaSquare.jpg", notes: "Craig is a cool fella")
        images.append(newPhoto)
        
        newPhoto = Photo(name: "ONPAF", filename:"CRAIGHUH.jpg", notes: "ONPA Office F")
        images.append(newPhoto)
        
        newPhoto = Photo(name: "ONPA H", filename:"ONPAB.jpg", notes: "ONPA Office H")
        images.append(newPhoto)
        
        newPhoto = Photo(name: "ONPA H", filename:"ONPAC.jpg", notes: "ONPA Office H")
        images.append(newPhoto)
    }
    
    override func numberOfSectionsInCollectionView(collectionView:
        UICollectionView) -> Int {
            return 1
    }
    

    
    override func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return images.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width/3, height: collectionView.frame.size.width/3)
    }
    
    override func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) ->
        UICollectionViewCell {
            
            //let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier,
            //forIndexPath: indexPath) as! MyCollectionViewCell
            
            // Configure the cell
            //let image = UIImage(named: images[indexPath.row])
            //cell.imageView.image = image
           let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! MyCollectionViewCell
            
            // Configure the cell...
            var currentPhoto = images[indexPath.item]
            cell.pinImage.image = UIImage(named: currentPhoto.filename)
            
 
            
            return cell
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        var secondScene = segue.destinationViewController as! DisplayViewController
//        let cell = sender as! UICollectionViewCell
//        if let indexPath = self.collectionView!.indexPathForCell(cell) {
//            
//            let selectedPhoto = images[indexPath.item]
//         //   secondScene.currentPhoto = UIImage(named: images[indexPath.row])
//            
//            
//        }
//        
//
//        
//    }

    
    
    
}
