//
//  ContentView.swift
//  Gacha
//
//  Created by A S on 2025/07/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSheet = false
    
    var body: some View {
        ZStack {
            Image("gacha")
                .resizable()
                .ignoresSafeArea()
            
            Button {
                showSheet = true
            } label: {
                 Image("Presentbox")
                    .resizable()
                    .scaledToFit()
            }
        }
        // フルモーダル画面を表示したい場合に使用
        .fullScreenCover(isPresented: $showSheet) {
            ResultView()
        }
    }
}

#Preview {
    ContentView()
}
