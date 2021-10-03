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
    @State private var visibleEmojiDetails: EmojiDetails?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiData) { emojiDetails in
                    Button(action: {
                        showingDetail.toggle()
                        visibleEmojiDetails = emojiDetails
                    }, label: {
                        EmojiItemView(emoji: emojiDetails.emoji, emojiName: emojiDetails.name)
                    })
                }
            }
            .foregroundColor(.black)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Emojibook")
        }
        .onOpenURL { url in
            guard let emojiDetails = emojiData.first(where: { $0.url == url }) else { return }
                  visibleEmojiDetails = emojiDetails
        }
        .sheet(item: $visibleEmojiDetails, content: { emojiDetails in
              EmojiDetailsView(emojiDetails: emojiDetails)
            })
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
