//
//  ViewDetailController.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/04/28.
//

import UIKit

class ViewDetailController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var dateOutput: UILabel!
    @IBOutlet weak var playerNameOutput1: UIButton!
    @IBOutlet weak var playerNameOutput2: UIButton!
    @IBOutlet weak var playerNameOutput3: UIButton!
    @IBOutlet weak var playerNameOutput4: UIButton!
    @IBOutlet weak var setSelect: UIPickerView!
    @IBOutlet weak var gameSelect: UIPickerView!
    
    @IBOutlet weak var serverTeam1: UIView!
    @IBOutlet weak var serverTeam2: UIView!
    @IBOutlet weak var playerNameArea: UIView!
    @IBOutlet weak var gameSelectArea: UIView!
    
    // 前画面から引き継いだデータ
    var receivedPlayer1Name = "";
    var receivedPlayer2Name = "";
    var receivedPlayer3Name = "";
    var receivedPlayer4Name = "";
    var startDate = "";

    // この画面で選択したデータ
    var serverPlayerName = "";
    var serverPlayerTeam = "";
    var playSetCount = 0;
    var playGameCount = 0;

    // シングルスフラグ（入力プレイヤー数で判定）
    var singlesFlag = true;
    
    // プレゼンターの初期化
    let present = SeguePresenter()
    
    // UIPicker関連
    let setList = [1,3,5]
    let gameList = [1,2,6]
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        pickerView.setValue(UIColor.black, forKeyPath: "textColor")
        return 1
    }
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return setList.count
        }else{
            return gameList.count
        }
    }
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return setList[row].description
        }else{
            return gameList[row].description
        }
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        if pickerView.tag == 1{
            playSetCount = setList[row]
        }else{
            playGameCount = gameList[row]
        }
    }

    @IBAction func tapServer1(_ sender: Any) {
        serverTeam1.layer.borderColor = UIColor.red.cgColor
        serverTeam1.layer.borderWidth = 3.0
        serverTeam1.layer.cornerRadius = 10
        serverTeam2.layer.borderWidth = 0
        serverPlayerTeam = "A"
    }
    
    @IBAction func tapServer2(_ sender: Any) {
        serverTeam2.layer.borderColor = UIColor.red.cgColor
        serverTeam2.layer.borderWidth = 3.0
        serverTeam2.layer.cornerRadius = 10
        serverTeam1.layer.borderWidth = 0
        serverPlayerTeam = "B"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        present.viewDetailDelegate = self
        
        // UIPickerViewの設定(セット数)
        setSelect.delegate = self
        setSelect.dataSource = self
        setSelect.tag = 1
        // UIPickerViewの設定(ゲーム数)
        gameSelect.delegate = self
        gameSelect.dataSource = self
        gameSelect.tag = 2
        
        // 前の画面からのデータ引き継ぎ
        dateOutput.text = startDate
        playerNameOutput1.setTitle(receivedPlayer1Name, for: .normal)
        playerNameOutput2.setTitle(receivedPlayer2Name, for: .normal)
        
        if receivedPlayer3Name != "" && receivedPlayer4Name != ""{
            // ダブルス
            playerNameOutput3.setTitle(receivedPlayer3Name, for: .normal)
            playerNameOutput4.setTitle(receivedPlayer4Name, for: .normal)
            singlesFlag = false;
        }
        
        playerNameArea.layer.borderColor = UIColor(red: 46/255, green: 139/255, blue: 87/255, alpha: 1).cgColor
        playerNameArea.layer.borderWidth = 1.0
        
        gameSelectArea.layer.borderColor = UIColor(red: 46/255, green: 139/255, blue: 87/255, alpha: 1).cgColor
        gameSelectArea.layer.borderWidth = 1.0
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // データの受け渡し
        present.dataSet(segue: segue)
    }
}
