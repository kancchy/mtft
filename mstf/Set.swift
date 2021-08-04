//
//  Set.swift
//  mstf
//
//  Created by 神田宗明 on 2021/03/10.
//

import Foundation
class Set {
    private (set) var gameCount:[Game] = [] ;
    private (set) var numberOfGamesForTeamA:Int = 0 ;
    private (set) var numberOfGamesForTeamB:Int = 0 ;
    private (set) var breakGames:[Int]? ;
    var gameNumOneSet:Int = 6 ;

    func scored(game:Game?){
        gameCount.append(game!);
        let teamName = game?.findTheNameOfTheTeamThatGotTheGame()
        if teamName == "A" {
            numberOfGamesForTeamA += 1
        } else {
            numberOfGamesForTeamB += 1
        }
    }
    
    func isFinish(teamName:String) -> Bool{
        // 取得したポイントがAdまたは４０だったらgameを終わらせる
        print("game count A::" + numberOfGamesForTeamA.description);
        print("game count B::" + numberOfGamesForTeamB.description);

        if numberOfGamesForTeamA > numberOfGamesForTeamB && numberOfGamesForTeamA >= gameNumOneSet && teamName == "A" {
            return true
        } else if numberOfGamesForTeamA < numberOfGamesForTeamB && numberOfGamesForTeamB >= gameNumOneSet && teamName == "B" {
            return true
        } else{
            return false
        }
    }
    
    func findTheNameOfTheTeamThatGotTheSet() -> String{
        // gameCountに追加した一番最後のポイントを取ったチーム名を返す
        return gameCount.last!.scoredTeam
    }
    
    // ポップアップを表示するゲーム数を判定
    func isDisplaySelectServerPopup() -> Bool{
        return gameCount.count < 2
    }
    
    //　最後にサーバしたチームを取得
    func getLastServerTeam() -> String{
        return gameCount.last!.server
    }
    
    // 次のサーバチームを取得
    func getNextServerTeam() -> String{
        if gameCount.last!.server == "A"{
            return "B"
        }else{
            return "A"
        }
    }
    
    public func findGame(gameNoLabel gameNo:Int) {
        
    }
}
