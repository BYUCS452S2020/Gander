//
//  Singleton.swift
//  GanderClient
//
//  Created by Joseph Koetting on 6/10/20.
//  Copyright © 2020 Joseph Koetting. All rights reserved.
//

import Foundation

// Beach People
var test_person_beach_a = Person(test_id: "0", firstName: "Joseph", lastName: "Brayer", profile_pic: ImageManager.beach_man_comment_a)
var test_person_beach_b = Person(test_id: "1", firstName: "Leroy", lastName: "Jenkins", profile_pic: ImageManager.beach_man_comment_b)
var test_person_beach_c = Person(test_id: "2", firstName: "Brendan", lastName: "Fargo", profile_pic: ImageManager.beach_man_comment_c)

var test_person_beach_post = Person(test_id: "3", firstName: "Thomas", lastName: "Hatfield", profile_pic: ImageManager.beach_man_post)

// Kayaking People
var test_person_kayaking_post = Person(test_id: "4", firstName: "Jessica", lastName: "Madden", profile_pic: ImageManager.kayaking_man_post)

// Camping People
var test_person_camping_post = Person(test_id: "5", firstName: "Pablo", lastName: "Salizar", profile_pic: ImageManager.camping_man_post)

// Beach Comments
var test_comment_beach_a = Post(testId: "100", isPost: false, title: "Beach", personID: "0", picture: ImageManager.beach_comment_a, content: "Cool post Bro. My family loved it here!", comments: [], ParentID: "0")
var test_comment_beach_b = Post(testId: "101", isPost: false, title: "Beach", personID: "1", picture: ImageManager.beach_comment_b, content: "The water was excellent!", comments: [], ParentID: "0")
var test_comment_beach_c = Post(testId: "102", isPost: false, title: "Beach", personID: "2", picture: ImageManager.beach_comment_c, content: "A great place for family photos.", comments: [], ParentID: "0")


// Beach Comments Array
var test_comments_beach = [test_comment_beach_a, test_comment_beach_b, test_comment_beach_c]

// Beach Post
var test_post_beach = Post(testId: "0", isPost: true, title: "Beach", personID: "3", picture:  ImageManager.beach_post, content:"Taking my family out to Pleasant View Beach!", comments: test_comments_beach, ParentID: "3452")

// Kayaking Post
var test_post_kayaking = Post(testId: "1", isPost: true, title: "Kayaking", personID: "4", picture:  ImageManager.kayaking_post, content:"First time Kayking in Anartica!", comments: test_comments_beach, ParentID: "1234")

// Kayaking Comments
var test_comment_kayaking_a = Post(testId: "1003", isPost: false, title: "Kayaking", personID: "0", picture: ImageManager.beach_comment_a, content: "Cool post Bro. My family loved it here!", comments: [], ParentID: "1")

// Camping Post
var test_post_camping = Post(testId: "2", isPost: true, title: "Camping", personID: "5", picture:  ImageManager.camping_post, content:"Camping right outside Bleak Fall Barrow!", comments: test_comments_beach, ParentID: "4321")

// Camping Comments
var test_comment_camping_a = Post(testId: "7", isPost: false, title: "Camping", personID: "5", picture: ImageManager.beach_comment_a, content: "Cool post Bro. My family loved it here!", comments: [], ParentID: "2")


// ALL PEOPLE
var savePerson = [test_person_beach_a, test_person_beach_b, test_person_beach_c, test_person_beach_post,
                    test_person_kayaking_post,
                    test_person_camping_post]
var savePost = [test_comment_beach_a, test_comment_beach_b, test_comment_beach_c, test_post_beach,
                test_comment_kayaking_a, test_post_kayaking,
                test_comment_camping_a, test_post_camping]

var realPerson: [Person] = []
var realPosts: [Post] = []
var realCoolPosts: [Post] = []

