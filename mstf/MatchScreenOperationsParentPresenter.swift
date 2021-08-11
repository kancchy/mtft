//
//  Match ScreenOperationsParentPresenter.swift
//  mstf
//
//  Created by 神田宗明 on 2021/05/26.
//

import Foundation
import UIKit


class MatchScreenOperationsParentPresenter{
    var delegate:MatchParentController? = nil;

    func updatePoint(game:GameParent){
        let dispPoint1 = game.cnvPoint(point:game.gamePointCountTeamA)
        let dispPoint2 = game.cnvPoint(point:game.gamePointCountTeamB)
        delegate?.point1BtnParent.setTitle(dispPoint1, for: .normal)
        delegate?.point2BtnParent.setTitle(dispPoint2, for: .normal)
    }
    
    func addSetCount(score:Score){
        // stackViewにnewViewを追加する
        delegate?.team1StackViewParent.addArrangedSubview(createStackViewCell())
        delegate?.team2StackViewParent.addArrangedSubview(createStackViewCell2())
        
        delegate?.leftSetNumParent.text = "\(score.numberOfSetsForTeamA)"
        delegate?.rightSetNumParent.text = "\(score.numberOfSetsForTeamB)"
    }
    
    func changeServerTeamBackgroundColor(serverName:String){
        // 仮：サーバーチームを色変え
        if serverName == "A"{
            delegate?.player1NameParent.backgroundColor = UIColor.red
            delegate?.player3NameParent.backgroundColor = UIColor.red
            delegate?.player2NameParent.backgroundColor = UIColor.clear
            delegate?.player4NameParent.backgroundColor = UIColor.clear
        }else{
            delegate?.player2NameParent.backgroundColor = UIColor.red
            delegate?.player4NameParent.backgroundColor = UIColor.red
            delegate?.player1NameParent.backgroundColor = UIColor.clear
            delegate?.player3NameParent.backgroundColor = UIColor.clear
        }
    }
    
    func updateGameCount(set:Set){
        // 画面にゲームを反映
        var nowSet:UIView?  = delegate?.team1StackViewParent.subviews.last
        var testLabel: UILabel?  = nowSet!.subviews.first as? UILabel
        testLabel?.text = "\(set.numberOfGamesForTeamA)"
        nowSet = delegate?.team2StackViewParent.subviews.last
        testLabel  = nowSet!.subviews.first as? UILabel
        testLabel?.text = "\(set.numberOfGamesForTeamB)"
    }
    
    func disablePointBtn(){
        delegate?.point1BtnParent.isEnabled = false
        delegate?.point2BtnParent.isEnabled = false
        delegate?.fault1BtnParent.isEnabled = false
        delegate?.fault2BtnParent.isEnabled = false
    }
    
    // フォルトボタンの非活性化
    func disableFaultBtn(teamName:String){
        if teamName == "B"{
            delegate?.fault1BtnParent.isEnabled = false
            delegate?.fault2BtnParent.isEnabled = true
        }else{
            delegate?.fault1BtnParent.isEnabled = true
            delegate?.fault2BtnParent.isEnabled = false
        }
    }
    
    func createStackViewCell() -> UIView {
        // 新規追加するViewを作成
        let newView = UIView()
        let label = UILabel()
        newView.addSubview(label);
        // 背景を緑に設定
        newView.backgroundColor = UIColor.green
        // 枠線を設定
        newView.layer.borderColor = UIColor.black.cgColor
        newView.layer.borderWidth = 1.0
        // 追加されたViewがわかりやすいように、ナンバリング
        label.text = "A"
        label.sizeToFit()
        label.textColor = UIColor.black
        label.tag = 1

        // 新規Viewに height=100 の制約を追加 ←【超重要】
        newView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView;
    }
    
    func createStackViewCell2() -> UIView {
        // 新規追加するViewを作成
        let newView = UIView()
        let label = UILabel()
        newView.addSubview(label);
        // 背景を緑に設定
        newView.backgroundColor = UIColor.yellow
        // 枠線を設定
        newView.layer.borderColor = UIColor.black.cgColor
        newView.layer.borderWidth = 1.0
        // 追加されたViewがわかりやすいように、ナンバリング
        label.text = "B"
        label.sizeToFit()
        label.textColor = UIColor.black
        label.tag = 2
        // 新規Viewに height=100 の制約を追加 ←【超重要】
        newView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        newView.translatesAutoresizingMaskIntoConstraints = false
        return newView;
    }

}
