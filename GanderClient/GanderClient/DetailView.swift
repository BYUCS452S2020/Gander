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
            PostListView(posts: [post] + post.comments)
            Spacer()
        }
    }
}   


