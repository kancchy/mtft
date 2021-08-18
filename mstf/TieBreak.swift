//
//  TieBreak.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/03/10.
//

import Foundation

class TieBreak : GameParent{
    init(playeraName1:String, playeraName2:String, playeraName3:String, playeraName4:String) {
        self.playeraName1 = playeraName1;
        self.playeraName2 = playeraName2;
        self.playeraName3 = playeraName3;
        self.playeraName4 = playeraName4;
        super.init(pointBeforeTheEnd: 6)
        activePoint = GamePointForTieBreak(server:server, serverPlayerName:serverPlayerName, receiver: "");
    };
    
    var playeraName1:String
    var playeraName2:String
    var playeraName3:String
    var playeraName4:String

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
                if (playeraName3 == serverPlayerName) {
                    
                }
            } else {
                server = "A"
            }
        }
        
        activePoint = GamePointForTieBreak(server:server, serverPlayerName:serverPlayerName, receiver: "")
    }
    
    override func cnvPoint(point:Int) -> String{
        return point.description;
    }
}
