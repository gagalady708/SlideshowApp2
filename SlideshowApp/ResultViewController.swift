//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 國光陵平 on 2020/09/30.
//  Copyright © 2020 國光陵平. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var image:UIImage!
    
    @IBOutlet weak var detail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detail.image = self.image

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
