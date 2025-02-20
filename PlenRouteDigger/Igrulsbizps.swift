//
//  Igrulsbizps.swift
//  PlenRouteDigger
//
//  Created by Nicolae Chivriga on 21/02/2025.
//

import SwiftUI
import Lottie

struct Igrulsbizps: View {
    @State var endog: Bool = false 
    var body: some View {
        ZStack {
            Image(Constants.bgsquaiobgierusfi)
                .resizable()
                .ignoresSafeArea()
            
            if !endog {
                LottieView(animation: .named("firsutqzbor"))
                    .playing(loopMode: .loop)
                    .resizable()
                    .frame(width: 220, height: 220)
            }
            
            WKWebViewRepresentable(url: URL(string: "https://plays.org/game/route-digger-2/")!) {
                Constants.vibr(style: .heavy)
                endog = true 
            }
            .mask {
                if UIScreen.main.bounds.height > 680 {
                    Rectangle()
                        .frame(height: UIScreen.main.bounds.height * 0.80)
                } else {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.86)
                }
            }
                
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Constants.BackBUtoncik())
    }
}
