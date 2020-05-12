//
//  DetailViewController.swift
//  Gin_Rum_Yum
//
//  Created by Mike Lewis on 4/1/20.
//  Copyright © 2020 Mike Lewis. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    @IBAction func slideChanged(_ sender: Any) {
        switch swapper.selectedSegmentIndex
        {
        case 0:
            generateListIng()
        case 1:
            lblText.text = selectDrink!.Drink_inst
        default:
            break
        }
    }
    @IBOutlet weak var swapper: UISegmentedControl!
    
    @IBOutlet weak var imgDrink: UIImageView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    fileprivate func generateListIng() {
        var list = ""
        for element in selectDrink!.ing_list{
            list += element + "\r\n"
        }
        lblText.text = list
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //code
        if (segue.identifier == "videoDetail"){
            let controller = segue.destination as! VideoViewController
            controller.videoDrink = selectDrink!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
        detailDescriptionLabel.text = selectDrink?.Drink_name
        let img:UIImage = getImg(named: selectDrink!.Drink_pic)
        imgDrink.image = img
        generateListIng()
    }
    
    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    var selectDrink: Drink?

    func getImg(named imageName:String) -> UIImage {
        let uri = URL(string: imageName)
        let dataBytes = try? Data(contentsOf:uri!)
        let img = UIImage(data: dataBytes!)
        return img!
    }
}

