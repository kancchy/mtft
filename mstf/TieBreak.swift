//
//  TieBreak.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/03/10.
//

import Foundation

class TieBreak : GameParent{
    init(playeraName1:String, playeraName2:String, playeraName3:String, playeraName4:String) {
        self.playerName1 = playeraName1;
        self.playerName2 = playeraName2;
        self.playerName3 = playeraName3;
        self.playerName4 = playeraName4;
        super.init(pointBeforeTheEnd: 6)
        activePoint = GamePointForTieBreak(server:server, serverPlayerName:serverPlayerName, receiver: "");
    };
    
    var playerName1:String = "";
    var playerName2:String = "";
    var playerName3:String = "";
    var playerName4:String = "";

    override func scored(point:PointParent){
        activePoint.scoredTeam = scoredTeam

        gamePoint.append(point)
        if point.scoredTeam == "A" {
            gamePointCountTeamA += 1
        } else {
            gamePointCountTeamB += 1
        }
        
        if gamePoint.count % 2 > 0 {
          //サーバを交代
            if server == "A" {
                server = "B"
                serverPlayerName = self.getNextServerName(playerName1: playerName2, playerName2: playerName4)
            } else {
                server = "A"
                serverPlayerName = self.getNextServerName(playerName1:playerName1, playerName2: playerName3)
            }
        }
        activePoint = GamePointForTieBreak(server:server, serverPlayerName:serverPlayerName, receiver: "")
    }
    
    // 次のサーバープレイヤー名を取得
    func getNextServerName(playerName1:String,playerName2:String) -> String{
        let lastIndex: Int? = gamePoint.indices.last
        return gamePoint[lastIndex! - 1].serverPlayerName == playerName1 ? playerName2 : playerName1
    }
    
    override func cnvPoint(point:Int) -> String{
        return point.description;
    }
}
