//
//  Classes.swift
//  GanderClient
//
//  Created by Joseph Koetting on 6/4/20.
//  Copyright © 2020 Joseph Koetting. All rights reserved.
//

import Foundation
import SwiftUI


class Person {
    var firstName: String?
    var lastName: String?
}

class Post : Identifiable {
    var id = UUID()
    var title: String?
    var firstName: String?
    var picture: String?
    var content: String?
    var comments: [Post] = []
    
    init(title: String, firstName: String, picture: String?, content: String, comments: [Post]) {
        self.title = title
        self.firstName = firstName
        self.picture = picture
        self.content = content
        self.comments = comments
    }
}

// Test Data

var test_comment_A = Post(title: "Swimming", firstName: "452345234", picture: nil, content: "Cool post Bro", comments: [])
var test_comment_B = Post(title: "Swimming", firstName: "452345234", picture: nil, content: "Cool post Bro", comments: [])
var test_comment_C = Post(title: "Swimming", firstName: "452345234", picture: nil, content: "Cool post Bro", comments: [])
var test_comment_D = Post(title: "Swimming", firstName: "452345234", picture: nil, content: "Cool post Bro", comments: [])
var test_comment_E = Post(title: "Swimming", firstName: "452345234", picture: nil, content: "Cool post Bro", comments: [])

var test_comments_A = [test_comment_A, test_comment_C]
var test_comments_B = [test_comment_B, test_comment_D]
var test_comments_C = [test_comment_B, test_comment_D, test_comment_A, test_comment_E]

var test_post_A = Post(title: "Beach", firstName:"Joseph", picture:  ImageManager.beach_img, content:"Taking my family out to Pleasant View Beach", comments: test_comments_A)
var test_post_B = Post(title: "Kayaking", firstName:"Braeden", picture: ImageManager.kayaking_img, content:"Here is my post B", comments: test_comments_B)
var test_post_C = Post(title: "Camping", firstName:"Bob", picture: ImageManager.camping_img, content:"Here is my post C", comments: test_comments_C)

var posts = [test_post_A, test_post_B, test_post_C]

// Test Data
