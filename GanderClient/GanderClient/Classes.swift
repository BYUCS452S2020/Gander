//
//  Classes.swift
//  GanderClient
//
//  Created by Joseph Koetting on 6/4/20.
//  Copyright © 2020 Joseph Koetting. All rights reserved.
//

import Foundation
import SwiftUI


class Person: Codable {
    var id = UUID()
    var test_id: String
    var firstName: String
    var lastName: String
    var profile_pic: String
    
    init(test_id: String, firstName: String, lastName: String, profile_pic: String) {
        self.test_id = test_id
        self.firstName = firstName
        self.lastName = lastName
        self.profile_pic = profile_pic
    }
    
    func toCodable() -> PersonJson {
        return PersonJson(PersonID: test_id, FirstName: firstName, LastName: lastName, ProfilePic: profile_pic)
    }
}

class Post : Identifiable, Codable {
    var id = UUID()
    var testId: String
    var isPost: Bool
    var title: String
    var personID: String?
    var picture: String
    var content: String
    var date: String
    var comments: [Post]? = []
    var ParentID: String
    
    init(testId: String, isPost: Bool, title: String, personID: String?, picture: String, content: String, comments: [Post]?, ParentID: String) {
        self.testId = testId
        self.isPost = isPost
        self.title = title
        self.personID = personID
        self.picture = picture
        self.date = "23/34/23"
        self.content = content
        self.comments = comments
        self.ParentID = ParentID
    }
    
    func toCodable() -> PostJson {
        return PostJson(PostID: testId, Title: title, PersonID: personID ?? "0", PictureID: picture, Content: content, Date: date, ParentID: ParentID)
    }
    
    func initIsPost() {
        var posts: [Post] = []
        
        for post in realPosts {
            if (self.testId == post.ParentID) {
                posts.append(post)
            }
        }

        self.isPost = posts.count > 0
    }
    
    func getComments()-> [Post] {
        var posts: [Post] = []
        
        for post in realPosts {
            if (self.testId == post.ParentID) {
                posts.append(post)
            }
        }
        
        return posts
    }
    
    func getPerson()-> Person {
        var myperson: Person?
        
        for person in realPerson {
            if (self.personID == person.test_id) {
               myperson = person
            }
        }
        return myperson!
    }
}
