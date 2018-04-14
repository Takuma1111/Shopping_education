//
//  ViewController.swift
//  shopping_education
//
//  Created by 村上拓麻 on 2018/04/12.
//  Copyright © 2018年 村上拓麻. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func easy_Button(_ sender: UIButton) {
        let vc = UIStoryboard(name: "easy_story", bundle: nil).instantiateInitialViewController()!
        self.present(vc, animated: true)
    }
    
    @IBAction func normal_Button(_ sender: UIButton) {
        let vc = UIStoryboard(name: "normal_story", bundle: nil).instantiateInitialViewController()!
        self.present(vc, animated: true)
    }
    
    
    @IBAction func dif_Button(_ sender: UIButton) {
        let vc = UIStoryboard(name: "dif_story", bundle: nil).instantiateInitialViewController()!
        self.present(vc, animated: true)
    }
    
}

