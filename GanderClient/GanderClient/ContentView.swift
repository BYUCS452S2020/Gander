//
//  ContentView.swift
//  GanderClient
//
//  Created by Joseph Koetting on 5/26/20.
//  Copyright © 2020 Joseph Koetting. All rights reserved.
//


import SwiftUI

struct UpvoteView: View {
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.up")
            Text("Vote")
            Image(systemName: "arrow.down")
        }
    }
}

struct DoneItView: View {
    
    var body: some View {
        HStack {
            Image(systemName: "star")
            Text("Done It")
        }
    }
}

struct ShareView: View {
    
    var body: some View {
        HStack {
            Image(systemName: "square.and.arrow.up")
            Text("Share")
        }
    }
}

struct AwardView: View {
    
    var body: some View {
        HStack {
            Image(systemName: "shield")
            Text("Award")
        }
    }
}

struct PostView: View {
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(post.getPerson().profile_pic)
                    .resizable()
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .frame(width: 30, height: 30, alignment: .leading)
                
                // Username
                Text("\(post.getPerson().firstName)")
                    .font(.system(size: 18))
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .foregroundColor(ColorManager.textGrey)
                
            }
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 20))
            
            
            Text("\(post.content)").padding(10)
            
            
            
            Image("\(post.picture)").resizable().scaledToFit()
            
            if (post.isPost) {
                HStack {
                    UpvoteView()
                    Spacer()
                    DoneItView()
                    Spacer()
                    ShareView()
                    Spacer()
                    AwardView()
                    
                    NavigationLink(destination: DetailView(post: post)) {Text("")}.buttonStyle(PlainButtonStyle()).opacity(0).frame(width: 0)
                    //        .navigationBarTitle("", displayMode: .inline) // custom back button
                }
                .padding(10)
                .foregroundColor(ColorManager.textGrey)
                .font(.system(size: 15))
            }
            else {
                HStack {
                    UpvoteView()
                    Spacer()
                    ShareView()
                    Spacer()
                    AwardView()
                }
                .padding(10)
                .foregroundColor(ColorManager.textGrey)
                .font(.system(size: 15))
            }
            
        }
        .background(ColorManager.postGrey)
        .frame(maxWidth: .infinity)
            
        // THIS IS HACKING BUT CANT FIND REASONABLE SOLUTION
        .padding([.leading, .trailing], -20)
        .padding([.top], -5)
    }
    
}

struct PostListView: View {
    var posts: [Post]
    
    init( posts: [Post]) {
        self.posts = posts
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    
    var body: some View {
        List(posts) {post in PostView(post: post)}
    }
}

struct ContentView: View {
    @State var whatViewShow: Int = 1
    var body: some View {
        NavigationView {
            VStack {
                if whatViewShow == 0
                {
                    PostListView(posts: realCoolPosts)
                        .animation(.spring())
                        .transition(.slide)
                }
                if whatViewShow == 1
                          {
                              ButtonView(whatViewShow: self.$whatViewShow)
                          }
            }
            .navigationBarTitle(Text("Gander"), displayMode: .inline)
            
        }
    }
}

