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
                   var kariName: String!
                   var imageCollection: Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        //enlargedImageに画像を代入
        enlargedImageView.image = UIImage(named: kariName)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //ViewControllerを取得
        let  viewController: ViewController = segue.destination as! ViewController
        //遷移先のkariName2に拡大図の画像の名前を代入
        viewController.kariName2 = kariName
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
