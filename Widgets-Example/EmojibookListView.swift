//
//  ContentView.swift
//  Widgets-Example
//
//  Created by Carlos Carmo on 02/10/21.
//

import SwiftUI

struct EmojibookListView: View {
    
    let emojiData: [EmojiDetails] = EmojiProvider.all()
    @State private var showingDetail: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiData, content: { emojiDetails in
                    Button(action: {
                        showingDetail.toggle()
                    }, label: {
                        EmojiItemView(emoji: emojiDetails.emoji, emojiName: emojiDetails.name)
                    })
                    .sheet(isPresented: $showingDetail) {
                        EmojiDetailsView(emojiDetails: emojiDetails)
                    }
                })
            }
            .foregroundColor(.black)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Emojibook")
        }
    }
}

struct EmojiItemView: View {
    let emoji: String
    let emojiName: String
    
    var body: some View {
        Text("\(emoji) \(emojiName)")
            .font(.largeTitle)
            .padding([.top, .bottom])
    }
}

struct EmojibookListView_Previews: PreviewProvider {
    static var previews: some View {
        EmojibookListView()
    }
}
