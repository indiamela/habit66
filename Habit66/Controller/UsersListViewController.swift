import UIKit
import Firebase

class UsersListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var usersTableView: UITableView!
    var users: [User]!

    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.dataSource = self
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let ref = Database.database().reference()
        
//        let ref = Database.database().reference()

        // KeyValue型の配列を用意しておきます。
        let user = ["name":"Tarou Yamada", "age":"20", "favorite":"jogging"]

        // データを追加します。idは自動で設定してくれます。
        ref.child("Users").childByAutoId().setValue(user)

//        ref.child("Users").observe(.value) { (snapshot) in
//            // 初期化
//            self.users = []
//
//            for data in snapshot.children {
//                let snapData = data as! DataSnapshot
//                let dictionarySnapData = snapData.value as! [String: Any]
//
//                var user = User()
//                // 取得した内容をユーザー型にセット
//                user.setFromDictionary(dictionarySnapData)
//
//                // ユーザーリストに追加
//                self.users.append(user)
//            }
//
//            // すべてユーザーリストに格納したら、TableViewを更新する。
//            self.usersTableView.reloadData()
//        }
    }

    // MARK: - TableViewMethod
    // セルの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _users = users else { return 0 }
        return _users.count
    }
    // セルに値をセット
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = usersTableView.dequeueReusableCell(withIdentifier: "UserTableCell", for: indexPath)

        let user = users[indexPath.row]

        let nameLabel = cell.viewWithTag(1) as! UILabel
        nameLabel.text = user.name

        let ageLabel = cell.viewWithTag(2) as! UILabel
        ageLabel.text = String(user.age)

        let favoriteLabel = cell.viewWithTag(3) as! UILabel
        favoriteLabel.text = user.favoriteFood

        return cell
    }
    // セルタップ時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }

}
