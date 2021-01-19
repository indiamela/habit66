import UIKit
import Firebase

class UsersEditViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var favoriteFoodText: UITextField!
    @IBOutlet weak var submitButton: UIButton!

    var user: User!
    // 前画面からキーを受け取る
    var key: String!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 前画面から受け取った値をセットする
        // (ホントはキーのみ受け取って再検索するほうが良さそう)

        nameText.text = String(user.name)
        ageText.text = String(user.age) 
        favoriteFoodText.text = user.favoriteFood 
    }

    // MARK: - EventFunctions
    @IBAction func submitButtonTapped(_ sender: UIButton) {

        let ref = Database.database().reference()

        // 入力内容をUserインスタンスに入れる
        var newUser = User()
        newUser.name = nameText.text!
        newUser.age = Int(ageText.text!) ?? 0
        newUser.favoriteFood = favoriteFoodText.text!


        // データを更新
        ref.child("Users").child(key).setValue(newUser.toDictionary)

        // 処理終了後 前画面に戻る
        self.navigationController?.popViewController(animated: true)
    }

}
