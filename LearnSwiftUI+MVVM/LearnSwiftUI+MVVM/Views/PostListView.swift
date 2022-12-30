//
//  ContentView.swift
//  LearnSwiftUI+MVVM
//
//  Created by Tiara Mahardika on 30/12/22.
//

import SwiftUI

struct PostListView: View {
    @StateObject var viewModel =  PostListViewModel()
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.posts, id: \.id) { post in
                    PostCell(post: post)
                }
                .navigationTitle("Posts")
            }.onAppear { viewModel.getPosts() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
