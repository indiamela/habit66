//
//  createViewController.swift
//  Habit66
//
//  Created by 楠瀬大志 on 2021/01/10.
//

import UIKit

class createViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var wishText: UITextField!
    
    var createNew = [String]()
    
    //配列
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //nextButton
        //グレー表示
        wishText.delegate = self
    }
    
    //キーボードを隠す
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        wishText.resignFirstResponder()
        return true
    }
    
    //テキストを一文字以上入力したら次へボタンが表示される
    
    
    //次へ
    @IBAction func nextButton(_ sender: Any) {
        createNew.append(wishText.text ?? "")
        let nextVC = storyboard?.instantiateViewController(withIdentifier:"next") as! outcomeViewController
        nextVC.createNew = createNew
        navigationController?.pushViewController(nextVC,animated: true)
        createNew = []
//        performSegue(withIdentifier: "toNext", sender: nil)
        
    }
    

    
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
