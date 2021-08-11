//
//  Game.swift
//  mstf
//
//  Created by hiroto.tajiri.ts on 2021/03/10.
//

import Foundation

class Game : GameParent{
    
    init() {
        super.init(pointBeforeTheEnd: 3)
        activePoint = GamePoint();
    }
    
    override func scored(point:PointParent){
        gamePoint.append(point)
        if point.scoredTeam == "A" {
            gamePointCountTeamA += 1
        } else {
            gamePointCountTeamB += 1
        }
        activePoint = GamePoint()
    }
}
