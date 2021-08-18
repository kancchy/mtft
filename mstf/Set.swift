//
//  Set.swift
//  mstf
//
//  Created by 神田宗明 on 2021/03/10.
//

import Foundation
class Set {
    private (set) var gameCount:[GameParent] = [] ;
    private (set) var numberOfGamesForTeamA:Int = 0 ;
    private (set) var numberOfGamesForTeamB:Int = 0 ;
    private (set) var breakGames:[Int]? ;
    var gameNumOneSet:Int = 6 ;
    
    func scored(game:GameParent?){
        gameCount.append(game!);
        let teamName = game?.findTheNameOfTheTeamThatGotTheGame()
        if teamName == "A" {
            numberOfGamesForTeamA += 1
        } else {
            numberOfGamesForTeamB += 1
        }
    }
    
    func isFinish(teamName:String) -> Bool{
        let lastGameIsTibrake = gameCount.last is TieBreak
        let plusCount:Int = (lastGameIsTibrake || gameNumOneSet == 1) ?1:2
                
        // 取得したゲームが終了ゲーム数だったらtrue
        if numberOfGamesForTeamA >= numberOfGamesForTeamB + plusCount && numberOfGamesForTeamA >= gameNumOneSet && teamName == "A" {
            return true
        } else if numberOfGamesForTeamA + plusCount <= numberOfGamesForTeamB && numberOfGamesForTeamB >= gameNumOneSet && teamName == "B" {
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

    // 次のサーバープレイヤー名を取得
    func getNextServerName(playerName1:String,playerName2:String) -> String{
        let lastIndex: Int? = gameCount.indices.last
        return gameCount[lastIndex! - 1].serverPlayerName == playerName1 ? playerName2 : playerName1
    }

    public func findGame(gameNoLabel gameNo:Int) {
        
    }
    
    func isTieBreak() -> Bool{
        if numberOfGamesForTeamA == numberOfGamesForTeamB && numberOfGamesForTeamA == gameNumOneSet{
            return true
        }
        return false
    }

}
