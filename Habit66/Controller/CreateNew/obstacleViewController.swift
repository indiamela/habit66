//
//  obstacleViewController.swift
//  Habit66
//
//  Created by 楠瀬大志 on 2021/01/11.
//

import UIKit

class obstacleViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var obstacleText: UITextField!
    @IBOutlet weak var obstacleTableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    var createNew = [String]()
    var obstacles = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isHidden = true
        
        let tblBackColor: UIColor = UIColor.clear
        obstacleTableView.backgroundColor = tblBackColor

        obstacleText.delegate = self
        obstacleTableView.delegate = self
        print(createNew)
        // Do any additional setup after loading the view.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return obstacles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルの取得
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "obstacleCell", for: indexPath)
        cell.textLabel!.text = obstacles[indexPath.row]
        return  cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    @IBAction func obstacleText(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            obstacles.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    //キーボードを隠す
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        obstacleText.resignFirstResponder()
        let newtext = obstacleText.text
        if newtext == ""{
            return true
        }
        if obstacles.count == 5{
            obstacleText.text = ""
            return true
        }
        obstacles.append(newtext!)
        obstacleTableView.reloadData()
        obstacleText.text = ""
        nextButton.isHidden = false

        return true
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        createNew.append(contentsOf: obstacles)
        let nextVC = storyboard?.instantiateViewController(identifier: "plan") as! planViewController
        nextVC.createNew = createNew
        navigationController?.pushViewController(nextVC, animated: true)
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
