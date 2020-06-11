//
//  WebAPIClasses.swift
//  GanderClient
//
//  Created by Joseph Koetting on 6/10/20.
//  Copyright © 2020 Joseph Koetting. All rights reserved.
//

import Foundation

struct PersonJson: Codable {
    var PersonID: String
    var FirstName: String
    var LastName: String
    var ProfilePic: String
    
    init(PersonID: String, FirstName: String, LastName: String, ProfilePic: String) {
        self.PersonID = PersonID
        self.FirstName = FirstName
        self.LastName = LastName
        self.ProfilePic = ProfilePic
    }
    
    func toPerson()->Person
    {
        return Person(test_id: PersonID, firstName: FirstName, lastName: LastName, profile_pic: ProfilePic)
    }
}

struct PostJson: Codable {
    var PostID: String
    var Title: String
    var PersonID: String
    var PictureID: String
    var Content: String
    var Date: String
    var ParentID: String
    
    init(PostID: String, Title: String, PersonID: String, PictureID: String, Content: String, Date: String, ParentID: String)
    {
        self.PostID = PostID
        self.Title = Title
        self.PersonID = PersonID
        self.PictureID = PictureID
        self.Content = Content
        self.Date = Date
        self.ParentID = ParentID
    }
    
    func toPost()->Post
    {
        return Post(testId: PostID, isPost: false, title: Title, personID: PersonID, picture: PictureID, content: Content, comments: nil, ParentID: ParentID)
    }
}
