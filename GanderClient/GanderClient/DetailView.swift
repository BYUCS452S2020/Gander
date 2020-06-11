//
//  DetailView.swift
//  GanderClient
//
//  Created by Joseph Koetting on 5/26/20.
//  Copyright © 2020 Joseph Koetting. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var post: Post
    
    var body: some View {
        VStack {
            PostListView(posts: [post] + post.getComments())
            Spacer()
        }
    }
}   

struct ButtonView: View {
    @Binding var whatViewShow: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {deleteData()}) {
                Text("Clear Database")}
                     
            Spacer()
            
            Button(action: {saveData()}) {
                  Text("Save to Database")}

            Spacer()

            Button(action: {loadData()}) {
                  Text("Load From Database")}
            
            Spacer()
            
            
            Button(action: {self.whatViewShow = 0}) {
                           Text("View App")}
            
            Spacer()
        }
    }
}
