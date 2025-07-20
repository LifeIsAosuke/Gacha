//
//  ResultView.swift
//  Gacha
//
//  Created by A S on 2025/07/20.
//

import SwiftUI

struct ResultView: View {
    
    @Environment(\.dismiss) var dismiss // @Environment... アプリの現在の状態にアクセス。そこからdismissアクションを取得している
    @State var backGroundImageName: String = "bgRed"
    @State var characterImageName: String = "iphone"
    @State var star: String = "⭐️⭐️"
    
    // アニメーションに関する変数
    @State var imageOffset = 0.0 // キャラクターの画像の位置を調整するための変数
    let animationHeight: CGFloat = -50 // アニメーションの高さを調整するための変数
    
    var body: some View {
        ZStack {
            
            Image(backGroundImageName)
                .resizable()
                .ignoresSafeArea()
            Image(characterImageName)
                .resizable()
                .frame(width: 350, height: 350)
                .offset(y: CGFloat(imageOffset) - 50) // CGFloat型にキャストする必要あり
                .onAppear {
                    
                    // easeInOut... アニメーションをなめらかに動くように設定
                    // repeatForever()... アニメーションを繰り返すように設定
                    withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                        
                        // １秒かけてanimationHeightの代入を行っている
                        imageOffset = animationHeight
                    }
                }
            
            VStack {
                
                HStack {
                    Button("閉じる") {
                        dismiss()
                    }
                    .padding(40)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.title)
                    
                    Spacer()
                }
                
                Spacer()
                
                Text(star)
                    .font(.largeTitle)
            }
        }
        .onAppear {
            // 画面表示された時の変数の設定はここで行う
            let number = Int.random(in: 0...9)
            
            switch number {
            case 9:
                // 乱数が9だった時の処理
                backGroundImageName = "bgBlue"
                characterImageName = "IoTMesh"
                star = "⭐️⭐️⭐️⭐️⭐️"
            case 8:
                // 乱数が8だった時の処理
                backGroundImageName = "bgGreen"
                characterImageName = "camera"
                star = "⭐️⭐️⭐️⭐️"
                
            case 0...7:
                // 乱数が0から7だった時の処理
                backGroundImageName = "bgRed"
                characterImageName = "iphone"
                star = "⭐️⭐️"
            default:
                // デフォルトの処理(今回は使わない)
                backGroundImageName = ""
                characterImageName = ""
                star = ""
            }
        }
    }
}

#Preview {
    ResultView()
}
