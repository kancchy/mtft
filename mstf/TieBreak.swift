//
//  TieBreak.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/03/10.
//

import Foundation

class TieBreak : GameParent{
    init() {
        super.init(pointBeforeTheEnd: 6)
        activePoint = GamePointForTieBreak();
    };

    override func scored(point:PointParent){
        gamePoint.append(point)
        if point.scoredTeam == "A" {
            gamePointCountTeamA += 1
        } else {
            gamePointCountTeamB += 1
        }
        activePoint = GamePointForTieBreak()
    }
    
    override func cnvPoint(point:Int) -> String{
        return point.description;
    }
}
