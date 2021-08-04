//
//  MatchKandaController.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/02/03.
//

import UIKit

class MatchKandaController : MatchParentController {

    override func viewDidLoad() {
        player1Name.text = inputPlayerName1;
        player2Name.text = inputPlayerName2;
        player3Name.text = inputPlayerName3;
        player4Name.text = inputPlayerName4;
        
        super.player1NameParent = self.player1Name
        super.player2NameParent = self.player2Name
        super.player3NameParent = self.player3Name
        super.player4NameParent = self.player4Name
        
        super.leftGameNumParent = self.leftGameNum
        super.rightGameNumParent = self.rightGameNum
        super.leftSetNumParent = self.leftSetNum
        super.rightSetNumParent = self.rightSetNum
        super.leftGameLineParent = self.leftGameLine
        super.rightGameLineParent = self.rightGameLine
        super.fault2BtnParent = self.rightFoultBtn
        super.fault1BtnParent = self.leftFoultBtn


        // 作らなきゃいけないもの
//        super.clearBtnParent = self.clearBtn
//        super.fault1BtnParent = self.fault1Btn
//        super.fault2BtnParent = self.fault2Btn
        super.viewDidLoad()

    }
    
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player3Name: UILabel!
    @IBOutlet weak var player4Name: UILabel!
    
    @IBOutlet weak var leftGameNum: UILabel!
    @IBOutlet weak var rightGameNum: UILabel!
    @IBOutlet weak var leftSetNum: UILabel!
    @IBOutlet weak var rightSetNum: UILabel!
    
    @IBOutlet weak var leftGameLine: UIStackView!
    @IBOutlet weak var rightGameLine: UIStackView!
    @IBOutlet weak var rightFoultBtn: UIButton!
    @IBOutlet weak var leftFoultBtn: UIButton!
    
    @IBAction func tapLeftView(_ sender: Any) {
        print("tap Left View")
        // プレゼンターの呼び出し
        presenter.scoredPoint(scoredTeam: "A")
        presenter.changeButtonLabel()
    }
    @IBAction func tapRightView(_ sender: Any) {
        print("tap Right View")
        // プレゼンターの呼び出し
        presenter.scoredPoint(scoredTeam: "B")
        presenter.changeButtonLabel()
    }
    
    @IBAction func pushLeftFoultBtn(_ sender: Any) {
        presenter.fault(faultTeam: "A")
    }
    @IBAction func pushRightFoultBtn(_ sender: Any) {
        presenter.fault(faultTeam: "B")
    }
    
    @IBAction func tapLeftFirstBtn(_ sender: Any) {
        presenter.scoredPoint(scoredTeam: "A")
        presenter.changeButtonLabel()
    }
    
    @IBAction func tapRightFirstBtn(_ sender: Any) {
        presenter.scoredPoint(scoredTeam: "B")
        presenter.changeButtonLabel()
    }
    
    override func presenterInit() {
        presenter.delegate = self
        presenter.screenOperator = VerticalMatchScreenOperationsPresenter();
        presenter.screenOperator?.delegate = self
        
        presenter.startNewSet(serverName:serverTeamName)
    }
}
