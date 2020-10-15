//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 國光陵平 on 2020/09/29.
//  Copyright © 2020 國光陵平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var gazou: UIImageView!
    @IBOutlet weak var startStop: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var timer: Timer!
    
    var timer_sec: Float = 0
    var imageId:Int = 0
    
    var imageArray:[UIImage] = [
        UIImage(named: "ぜんざい")!,
        UIImage(named: "そば")!,
        UIImage(named: "のどぐろ")!,
    ]
    
    @IBAction func unwind (_ segue: UIStoryboardSegue) {
    }
    @IBAction func tapimage(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gazou.image=imageArray[imageId]
    }
    
    @objc func updateTimer(_ timer: Timer) {
        self.imageId += 1
        if self.imageId >= 3{
        self.imageId = 0
        }
        self.gazou.image=imageArray[imageId]
    }
    
    @IBAction func next(_ sender: Any) {
        if imageId == 2 {
            imageId = 0
        } else {
            imageId += 1
        }
        gazou.image = imageArray[imageId]
    }
    
    @IBAction func back(_ sender: Any) {
        if imageId == 0 {
            imageId = 2
        } else {
            imageId -= 1
        }
        gazou.image = imageArray[imageId]
    }
    
    @IBAction func startStop(_ sender: Any) {
        
        if self.timer == nil {
            self.startTimer()
            nextButton.isEnabled = false
            backButton.isEnabled = false
            startStop.setTitle("停止", for: .normal)
        }else{
            self.pauseTimer()
            nextButton.isEnabled = true
            backButton.isEnabled = true
            startStop.setTitle("再生", for: .normal)
        }
   
    }
    
    func startTimer() {
        if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            }
    }
    
    func pauseTimer() {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.image = gazou.image
        if self.timer == nil {
        self.startTimer()
        nextButton.isEnabled = false
        backButton.isEnabled = false
        }else{
        self.pauseTimer()
        nextButton.isEnabled = true
        backButton.isEnabled = true
        startStop.setTitle("再生", for: .normal)
             }
        
         }
    }

    
    
    
    

