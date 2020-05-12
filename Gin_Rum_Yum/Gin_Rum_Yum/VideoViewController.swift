//
//  VideoViewController.swift
//  Gin_Rum_Yum
//
//  Created by Mike Lewis on 5/2/20.
//  Copyright © 2020 Mike Lewis. All rights reserved.
//
import Foundation
import UIKit
import WebKit

class VideoViewController:UIViewController {
    
    @IBOutlet weak var videoPlayer: WKWebView!
    @IBOutlet weak var lblDrinkName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDrinkName.text = videoDrink.Drink_name
        let dVid = URL(string: videoDrink.Drink_vid)
        let dReq = URLRequest(url: dVid!)
        videoPlayer.load(dReq)
    }
    var videoDrink:Drink = Drink()
    
}
