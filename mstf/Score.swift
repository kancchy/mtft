//
//  Score.swift
//  mstf
//
//  Created by 神田宗明 on 2021/03/10.
//

import Foundation

/// スコアドメインクラス
/// - parameter setCount: セットカウント（Setクラスの配列）
class Score {
    private (set) var setCount:[Set] = [];
    private (set) var numberOfSetsForTeamA:Int = 0 ;
    private (set) var numberOfSetsForTeamB:Int = 0 ;
    var setNumOneScore:Int = 1 ;
    var playerName1:String = "";
    var playerName2:String = "";
    var playerName3:String = "";
    var playerName4:String = "";

    func scored(set:Set?){
        setCount.append(set!);
        let teamName = set?.findTheNameOfTheTeamThatGotTheSet()
        if teamName == "A" {
            numberOfSetsForTeamA += 1
        } else {
            numberOfSetsForTeamB += 1
        }
    }

    func isFinish(teamName:String) -> Bool{
        print("set count:" + numberOfSetsForTeamA.description);
        print("set count:" + numberOfSetsForTeamB.description);
        
        if setNumOneScore >= 1{
            return self.isWinMulti(teamName:teamName)
        }else{
            return self.isWinSingle(teamName:teamName)
        }
    }
    
    func isWinMulti(teamName:String) -> Bool{
        
        let calcA:Double = Double(numberOfSetsForTeamA) / Double(setNumOneScore)
        let calcB:Double = Double(numberOfSetsForTeamB) / Double(setNumOneScore)
        
        if numberOfSetsForTeamA > numberOfSetsForTeamB && round(calcA) >= 1.0 && teamName == "A" {
            return true
        } else if numberOfSetsForTeamA < numberOfSetsForTeamB && round(calcB) >= 1.0 && teamName == "B" {
            return true
        } else{
            return false
        }
    }
    
    func isWinSingle(teamName:String) -> Bool{
        if numberOfSetsForTeamA > numberOfSetsForTeamB && numberOfSetsForTeamA >= setNumOneScore && teamName == "A" {
            return true
        } else if numberOfSetsForTeamA < numberOfSetsForTeamB && numberOfSetsForTeamB >= setNumOneScore && teamName == "B" {
            return true
        } else{
            return false
        }
    }
    
    // 次のサーバを判定
    func getNextServerTeam() -> String{
        if setCount.last!.gameCount.last!.server == "A"{
            return "B"
        }else{
            return "A"
        }
    }
    
    func finish(){
        print("game is over!!!!!!");
    }
}
