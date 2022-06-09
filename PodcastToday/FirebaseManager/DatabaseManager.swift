//
//  DatabaseManager.swift
//  PodcastToday
//
//  Created by YANA on 07/06/2022.
//

import UIKit
import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database(url: "https://podcasttoday-c4aa7-default-rtdb.firebaseio.com").reference()
    
    
    ///Check if username and email is avalable
    ///parameters
    ///-email:String representig email
    ///-username:String representid username
    public func canCreateNewUser(with email:String, username:String, completion: (Bool) -> Void){
        completion (true)
    }
    
    ///insert new user to database
    ///-Parametrs
    ///-email:String representing email
    ///-username:String representig username
    ///completion:async calllback for result if database entry succeded
    
    public func insertNewUser(with email:String, username:String, completion: @escaping (Bool)-> Void){
        database.child(email.safeDatabaseKey()).setValue(["username":username], withCompletionBlock: {
            error, _ in
            if error == nil{
                //succeeded
                completion (true)
                return
            }
            else{
                //failed
                completion(false)
                return
            }
        })
    }
    
    
}

