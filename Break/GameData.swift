//
//  GameData.swift
//  Break
//
//  Created by Jide Opeola on 1/29/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

////////Singleton



////Singleton set up 

//let _mainData: GameData = { GameData() }()
//
//class GameData: NSObject {
//    
//    class func mainData() -> GameData {
//        
//        return _mainData
//        
//    }
//   
//}

import UIKit

let _mainData: GameData = { GameData() }()

class GameData: NSObject {
    
    var topScore: Int = 0
    
// dictionary inside an array, String "key"..."AnyObject" if multiple different objects
    var gamesPlayed: [[String:Int]] = []

// dictionary
    var currentGame: [String:Int]? {
        
        get {
        
        return gamesPlayed[gamesPlayed.count - 1]
        
        }
        
        set {
            
            gamesPlayed[gamesPlayed.count - 1] = newValue!
            
        }
        
    }
    
    // (col,row)
    var allLevels = [
        
        (4,1),
        (6,2),
        (7,3),
        (8,4)
    
    ]
    
    var currentLevel = 0
    
    
    class func mainData() -> GameData {
        

        return _mainData

    }
    
    func startGame() {
        
        gamesPlayed.append([
            
            "livesLost":0,
            "bricksBusted":0,
            "levelBeaten":0,
            "totalScore":0
            
            ])
        
    }
    
    func adjustValue(difference: Int, forKey key: String) {
        
        // unwrapping currentGame[key]
        // currentGame[key] = 0....you are referencing the value NOT the key
        if var value = currentGame?[key] {
            
            currentGame?[key] = value + difference
            
            
        }
        
    }

}
