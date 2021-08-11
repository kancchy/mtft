//
//  GameParent.swift
//  mstf
//
//  Created by 神田宗明 on 2021/08/11.
//

import Foundation
class GameParent{
    
    var gamePoint:[PointParent] = [];
    var gamePointCountTeamA:Int = 0;
    var gamePointCountTeamB:Int = 0;
    // サーバ/レシーバーにはチーム名が入る
    public var server:String = "" ;
    public var serverPlayerName:String = "" ;
    private (set) var reciever:String? ;
    
    public var scoredTeam:String = "";
    
    var pointBeforeTheEnd:Int8 = 3;
    var activePoint:PointParent = PointParent();

    
    init(pointBeforeTheEnd:Int8) {
        self.pointBeforeTheEnd = pointBeforeTheEnd;
    }
    
    func scored(point:PointParent){
    }
    
    func cnvPoint(point:Int) -> String{
        let max: Int
        if gamePointCountTeamA >= pointBeforeTheEnd && gamePointCountTeamB >= pointBeforeTheEnd {
            if gamePointCountTeamA > gamePointCountTeamB {
                max = gamePointCountTeamA
            } else if gamePointCountTeamA < gamePointCountTeamB {
                max = gamePointCountTeamB
            } else{
                return Point.findPoint(point).rawValue
            }
            if max == point {
                return Point.Advantage.rawValue
            }
        }
        return Point.findPoint(point).rawValue
    }
    
    func isFinish(teamName:String) -> Bool{
        // 取得したポイントがAdまたはpointBeforeTheEndだったらgameを終わらせる
        if gamePointCountTeamA > gamePointCountTeamB && gamePointCountTeamA >= pointBeforeTheEnd && teamName == "A" {
            scoredTeam = "A";
            return true
        } else if gamePointCountTeamA < gamePointCountTeamB && gamePointCountTeamB >= pointBeforeTheEnd && teamName == "B" {
            scoredTeam = "B";
            return true
        } else{
            return false
        }
    }
    
    func findTheNameOfTheTeamThatGotTheGame() -> String{
        // gamePointに追加した一番最後のポイントを取ったチーム名を返す
        return gamePoint.last!.scoredTeam
    }
}
