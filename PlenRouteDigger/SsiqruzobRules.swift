//
//  SsiqruzobRules.swift
//  PlenRouteDigger
//
//  Created by Nicolae Chivriga on 21/02/2025.
//

import SwiftUI


struct SsiqruzobRules: View {
    @Environment(\.dismiss) var dismiss
    @State var sopoyavlis: Bool = false
    var body: some View {
        ZStack {
            Image(Constants.bgsquaiobgierusfi)
                .resizable()
                .ignoresSafeArea()
            Image("siqzipruls")
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees( sopoyavlis ? 360 : 0))
                .scaleEffect(sopoyavlis ? 1 : 0)
                .padding(25)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading:
                                Constants.BackBUtoncik())
        .onAppear() {
            Constants.vibr(style: .rigid)
            withAnimation(Animation.bouncy.delay(0.2)) {
                self.sopoyavlis = true
            }
        }
    }
}
