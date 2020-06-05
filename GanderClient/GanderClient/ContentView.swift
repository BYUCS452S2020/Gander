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
                Image("man_profile")
                    .resizable()
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .frame(width: 30, height: 30, alignment: .leading)
                
                // Username
                Text("\(post.firstName!)")
                    .font(.system(size: 18))
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .foregroundColor(ColorManager.textGrey)
                
            }
            .padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 20))
            
            
            Text("\(post.content!)").padding(10)
            
            
            
            Image("\(post.picture!)").resizable().scaledToFit()
            
            
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
        .background(ColorManager.postGrey)
        .frame(maxWidth: .infinity)
            
            // THIS IS HACKING BUT CANT FIND REASONABLE SOLUTION
            .padding([.leading, .trailing], -20)
            .padding([.top], -5)
    }
    
}

struct PostListView: View {
    
    init( whatViewShow: Binding<Int>) {
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
    @State var whatViewShow: Int = 0
    var body: some View {
        NavigationView {
            VStack {
                if whatViewShow == 0
                {
                    PostListView(whatViewShow: self.$whatViewShow)
                        .animation(.spring())
                        .transition(.slide)
                }
            }
            .navigationBarTitle(Text("Gander"), displayMode: .inline)
            
        }
    }
}

