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
    var id = UUID()
    var firstName: String?
    var lastName: String?
    var profile_pic: String?
    
    init(firstName: String, lastName: String, profile_pic: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.profile_pic = profile_pic
    }
}

class Post : Identifiable {
    var id = UUID()
    var isPost: Bool
    var title: String?
    var person: Person?
    var picture: String?
    var content: String?
    var date: String?
    var comments: [Post] = []
    
    init(isPost: Bool, title: String, person: Person, picture: String?, content: String, comments: [Post]) {
        self.isPost = isPost
        self.title = title
        self.person = person
        self.picture = picture
        self.content = content
        self.comments = comments
    }
}

// ###################
// Test Data
// ###################

// Beach People
var test_person_beach_a = Person(firstName: "Joseph", lastName: "Brayer", profile_pic: ImageManager.beach_man_comment_a)
var test_person_beach_b = Person(firstName: "Leroy", lastName: "Jenkins", profile_pic: ImageManager.beach_man_comment_b)
var test_person_beach_c = Person(firstName: "Brendan", lastName: "Fargo", profile_pic: ImageManager.beach_man_comment_c)

var test_person_beach_post = Person(firstName: "Thomas", lastName: "Hatfield", profile_pic: ImageManager.beach_man_post)

// Beach Comments
var test_comment_beach_a = Post(isPost: false, title: "Beach", person: test_person_beach_a, picture: ImageManager.beach_comment_a, content: "Cool post Bro. My family loved it here!", comments: [])
var test_comment_beach_b = Post(isPost: false, title: "Beach", person: test_person_beach_b, picture: ImageManager.beach_comment_b, content: "The water was excellent!", comments: [])
var test_comment_beach_c = Post(isPost: false, title: "Beach", person: test_person_beach_c, picture: ImageManager.beach_comment_c, content: "A great place for family photos.", comments: [])


// Beach Comments Array
var test_comments_beach = [test_comment_beach_a, test_comment_beach_b, test_comment_beach_c]

// Beach Post
var test_post_beach = Post(isPost: true, title: "Beach", person: test_person_beach_post, picture:  ImageManager.beach_post, content:"Taking my family out to Pleasant View Beach!", comments: test_comments_beach)

// Kayaking Comments

var test_comment_D = Post(isPost: false, title: "Swimming", person: test_person_beach_post, picture: nil, content: "Cool post Bro", comments: [])
var test_comment_E = Post(isPost: false, title: "Swimming", person: test_person_beach_post, picture: nil, content: "Cool post Bro", comments: [])

var test_comments_B = [test_comment_D, test_comment_E]

var test_post_B = Post(isPost: true, title: "Kayaking", person: test_person_beach_post, picture: ImageManager.kayaking, content:"My first trip Kayaking in Antartica.", comments: test_comments_B)
var test_post_C = Post(isPost: true, title: "Camping", person: test_person_beach_post, picture: ImageManager.camping, content:"We brought all of our kids to Bleak Falls Barrow!", comments: test_comments_B)

var test_posts = [test_post_beach, test_post_B, test_post_C]

// ###################
// Test Data
// ###################
