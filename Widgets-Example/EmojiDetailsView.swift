//
//  EmojiDetailsView.swift
//  Widgets-Example
//
//  Created by Carlos Carmo on 02/10/21.
//

import Foundation
import SwiftUI

struct EmojiDetailsView: View {
  var emojiDetails: EmojiDetails
  
  var body: some View {
    ZStack {
      // Background color
      Color(UIColor.systemIndigo).edgesIgnoringSafeArea(.all)

      // Emoji data
      VStack {
        VStack(alignment: .leading) {
          HStack {
            Text("\(emojiDetails.emoji) \(emojiDetails.name)")
              .font(.largeTitle)
              .bold()
          }
          .padding()

          Text(emojiDetails.description)
            .padding([.leading, .trailing, .bottom])
            .font(.title)
        }
      }
      .foregroundColor(.white)
    }
  }
}
