//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 佐々木　祐太 on 2018/12/09.
//  Copyright © 2018 佐々木　祐太. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tapView: UIImageView!
        //画像の管理する配列
    let imageCollection = ["201706060095_top_img_A", "etna_strom02", "kilauea-volcao", "Klyuchevskaya_crop_l"]
        //現在の画像の名前を入れる変数
    var nameOfImageView: String!
        //現在のインデックス番号を入れる変数
    var indexNumberOfImage: Int!
    
    @IBAction func nextButton(_ sender: UIButton) {
        //現在のtapView画像のインデックス番号の取得
        indexNumberOfImage = imageCollection.index(of: nameOfImageView)
        //最後の画像の時は最初の画像のインデックス番号を。それ以外は次のインデックス番号を代入。
        if indexNumberOfImage == 3{
            indexNumberOfImage = 0
        }else{ indexNumberOfImage = indexNumberOfImage + 1
        }
        //インデックス番号の画像の名前を新たに代入
            nameOfImageView = imageCollection[indexNumberOfImage]
        //画像の更新
            tapView.image = UIImage(named:nameOfImageView )
        
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
        //現在のtapViewの画像のインデックス番号の取得
        indexNumberOfImage = imageCollection.index(of: nameOfImageView)
        //最初の画像の時は最後の画像のインデックス番号を。それ以外は前のインデックス番号を代入。
        if indexNumberOfImage == 0{
            indexNumberOfImage = 3
        }else{ indexNumberOfImage = indexNumberOfImage - 1
        }
        //インデックス番号の画像の名前を新たに代入
            nameOfImageView = imageCollection[indexNumberOfImage]
        //画像の更新
            tapView.image = UIImage(named:nameOfImageView )
       
    }
    
    var timer: Timer!
    
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var slideShowButton: UIButton!
        //タイマー機能の実装
    @objc func updateTimer(_ timer: Timer){
        
        //現在のtapView画像のインデックス番号の取得
        indexNumberOfImage = imageCollection.index(of: nameOfImageView)
        //最後の画像の時は最初の画像のインデックス番号を。それ以外は次のインデックス番号を代入。
        if indexNumberOfImage == 3{
            indexNumberOfImage = 0
        }else{ indexNumberOfImage = indexNumberOfImage + 1
        }
        //インデックス番号の画像の名前を新たに代入
            nameOfImageView = imageCollection[indexNumberOfImage]
        //画像の更新
            tapView.image = UIImage(named:nameOfImageView )
        
    }

    @IBAction func stopAndGoButton(_ sender: UIButton) {
        //タイマーが止まっている時
        if timer == nil {
        //タイマースタート
           timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        //進む、止まるボタンの無効
           returnButton.isEnabled = false
           nextButton.isEnabled = false
        //ボタンの文字を「ストップ」に
            slideShowButton.setTitle("ストップ", for: .normal)
        //タイマーが動いている時
        }else{
        //タイマーストップ
            self.timer.invalidate()
            timer = nil
        //進む、戻るボタンの有効
            returnButton.isEnabled = true
            nextButton.isEnabled = true
        //ボタンの文字を「スタート」に
            slideShowButton.setTitle("スタート", for: .normal)
        }
    }
    
       //Exitの呼び出し元に設定
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //タップジェスチャーを有効にする。
        tapView.isUserInteractionEnabled = true
        //はじめの画像の名前を代入
        nameOfImageView = imageCollection[0]
        //画像の表示
        tapView.image = UIImage(named: nameOfImageView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //タイマーが動いていれば停止
    if timer !== nil{
        self.timer.invalidate()
        timer = nil
        //進む、戻るボタンの有効
        returnButton.isEnabled = true
        nextButton.isEnabled = true
        //ボタンの文字を「スタート」に
        slideShowButton.setTitle("スタート", for: .normal)
    }
        //EnlargedViewControllerを取得
    let enlargedViewController :EnlargedViewController = segue.destination as! EnlargedViewController
        //遷移先のkariImageにスライドショーの画像を代入
        enlargedViewController.kariImage = tapView.image
    
    }
    

}

