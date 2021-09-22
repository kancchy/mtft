//
//  User.swift
//  mstf
//
//  Created by 神田宗明 on 2021/09/15.
//

import RealmSwift

class User : Object {
    @objc dynamic var name:String = "" ;
    @objc dynamic var age:Int = 0 ;
    var list:List<String> = List<String>() ;
   // let tickets = List<Ticket>()

    @objc dynamic var agezzz:Int = 0 ;
}
