//
//  ViewController.swift
//  mstf
//
//  Created by 神田宗明 on 2021/01/20.
//

import UIKit

extension UINavigationController {
    open override var shouldAutorotate: Bool {
        guard let viewCtrl = self.visibleViewController else{return true}
        return viewCtrl.shouldAutorotate
    }
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard let viewCtrl = self.visibleViewController else{return .all}
        return viewCtrl.supportedInterfaceOrientations
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var makeMatch: UIButton!
    
    // プレゼンターの初期化
    let present = SeguePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Firebaseレポート用のクラッシュ処理
        // https://firebase.google.com/docs/crashlytics/test-implementation?platform=ios&authuser=3
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("Crash", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        present.delegate = self
        
        // 枠線のカラーと幅を指定
        player1.layer.borderColor = UIColor.gray.cgColor
        player1.layer.borderWidth = 1.0

        player2.layer.borderColor = UIColor.gray.cgColor
        player2.layer.borderWidth = 1.0
        
        player3.layer.borderColor = UIColor.gray.cgColor
        player3.layer.borderWidth = 1.0
        
        player4.layer.borderColor = UIColor.gray.cgColor
        player4.layer.borderWidth = 1.0
        
        makeMatch.layer.borderColor = UIColor(red: 46/255, green: 139/255, blue: 87/255, alpha: 1).cgColor
        makeMatch.layer.borderWidth = 2.0
        
        startDate.setValue(UIColor.black, forKey: "textColor")
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        fatalError("Illegal state")
    }

    @IBAction func onDidEndOnExitPlayer1(_ sender: UITextField) {
    }
    
    @IBAction func onDidEndOnExitPlayer2(_ sender: UITextField) {
    }
    
    @IBAction func onDidEndOnExitPlayer3(_ sender: UITextField) {
    }
    
    @IBAction func onDidEndOnExitPlayer4(_ sender: UITextField) {
    }
    
    
    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    @IBOutlet weak var player3: UITextField!
    @IBOutlet weak var player4: UITextField!
    
    @IBOutlet weak var startDate: UIDatePicker!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // データの受け渡し
        present.dataSet(segue: segue)
    }
}

