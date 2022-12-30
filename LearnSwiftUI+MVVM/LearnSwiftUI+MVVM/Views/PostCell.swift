//
//  PostCell.swift
//  LearnSwiftUI+MVVM
//
//  Created by Tiara Mahardika on 30/12/22.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(post.title)
                    .bold()
                    .font(.title2)
                    .lineLimit(2)
                
                
                Text(post.body)
                    .font(.body)
                    .lineLimit(4)
            }
            Spacer()
        }//.padding(.leading, 10)

    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(userId: 1, id: 2, title: "test", body: "body"))
    }
}
