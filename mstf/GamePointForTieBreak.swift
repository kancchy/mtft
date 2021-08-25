//
//  GamePointForTieBreak.swift
//  mstf
//
//  Created by 山口賢明 on 2021/03/10.
//

import Foundation
class GamePointForTieBreak : PointParent {
    private (set) public var pointPattern:PointPattern? ;
    var server:String?;
    var receiver:String? ;
    init (server:String?, serverPlayerName:String?, receiver:String?) {
        super.init()
        self.server = server;
        self.serverPlayerName = serverPlayerName;
        self.receiver = receiver;
    }
}
