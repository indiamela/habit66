//
//  outcomeViewController.swift
//  Habit66
//
//  Created by 楠瀬大志 on 2021/01/11.
//

import UIKit

class outcomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var outcomeTableView: UITableView!
    @IBOutlet weak var outcomeText: UITextField!
    
    var outcomes = [String]()
    var createNew = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outcomeTableView.delegate = self
        outcomeText.delegate = self
        print(createNew)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return outcomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルの取得
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "outcomeCell", for: indexPath)
        cell.textLabel!.text = outcomes[indexPath.row]
        return  cell
    }
    @IBAction func outcometext(_ sender: Any) {
        
    }
    

    
    //キーボードを隠す
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        outcomeText.resignFirstResponder()
        let newtext = outcomeText.text
        if newtext == ""{
            return true
        }
        if outcomes.count == 5{
            outcomeText.text = ""
            return true
        }
        outcomes.append(newtext!)
        outcomeTableView.reloadData()
        outcomeText.text = ""
        return true
    }
    
    //cellの削除
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            outcomes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
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
