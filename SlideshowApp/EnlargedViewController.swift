//
//  EnlargedViewController.swift
//  SlideshowApp
//
//  Created by 佐々木　祐太 on 2018/12/09.
//  Copyright © 2018 佐々木　祐太. All rights reserved.
//

import UIKit
class EnlargedViewController: UIViewController {

   
    
    @IBOutlet weak var enlargedImageView: UIImageView!
                   var kariImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //enlargedImageに画像を代入
        enlargedImageView.image = kariImage
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
