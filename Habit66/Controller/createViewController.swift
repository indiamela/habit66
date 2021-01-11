//
//  createViewController.swift
//  Habit66
//
//  Created by 楠瀬大志 on 2021/01/10.
//

import UIKit

class createViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var wishText: UITextField!
    var wish: String = ""
    
    //配列
    override func viewDidLoad() {

        //nextButton
        //グレー表示
        super.viewDidLoad()
        wishText.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //キーボードを隠す
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        wish = wishText.text ?? ""
        return true
    }
    
    //テキストを一文字以上入力したら次へボタンが表示される
    
    //次へ
    //配列に保存
    
    //完了ボタン
    //配列の中身全てをDBに入れる
    //FireBaseに送信
    
    
    //wish
    
    //Outcome
    
    //Obstacle
    
    //Plan

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
