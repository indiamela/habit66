//
//  ViewController.swift
//  Habit66
//
//  Created by 楠瀬大志 on 2020/12/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureSV()
    }
    
    func createLabel(contentsView:UIView) -> UILabel{
        //labelを作る 孫
        let label = UILabel()
        
        //labelの位置
        let labelX = contentsView.center.x
        let labelY = contentsView.center.y
        
        label.frame = CGRect(x: labelX, y: labelY, width: 95, height: 50)
        label.text = "Label"
        return label
    }
    
    func createContentsView() -> UIView{
        //contentsViewを作る　子
        let contentsView = UIView()
        contentsView.frame = CGRect(x: 0, y: 0, width: 800, height: 1200)
        //孫のlabelを載せる
        let label = createLabel(contentsView: contentsView)
        contentsView.addSubview(label)
        
        return contentsView
    }
    
    func configureSV(){
        //scrollViewにcontentsViewを載せる　親
        let subView = createContentsView()
        scrollView.addSubview(subView)
        
        // scrollViewにcontentsViewのサイズを教える
        scrollView.contentSize = subView.frame.size
    }
}

