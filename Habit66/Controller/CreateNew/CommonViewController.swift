//
//  CommonViewController.swift
//  Habit66
//
//  Created by 楠瀬大志 on 2021/01/13.
//

import UIKit

class CommonViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var wishText: UITextField!
    @IBOutlet weak var outputText: UILabel!
    
    var wish = ""
    var createNew = [String]()
    
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
        let input = wishText.text ?? ""
        outputText.text = input
        return true
    }
    
    //テキストを一文字以上入力したら次へボタンが表示される
    
    
    //次へ
    @IBAction func nextButton(_ sender: Any) {
        createNew.append(wishText.text ?? "")
        performSegue(withIdentifier: "toNext", sender: nil)
        
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
