//
//  SnizuVVerh.swift
//  PlenRouteDigger
//
//  Created by Nicolae Chivriga on 21/02/2025.
//

import SwiftUI
import StoreKit


struct SnizuVVerh: View {
    var body: some View {
        ZStack {
            Image(Constants.bgsquaiobgierusfi)
                .resizable()
                .ignoresSafeArea()
            
            Image("qowougtzkiw")
                .resizable()
                .scaledToFit()
                .padding(40)
                .overlay {
                    Button {
                        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                            SKStoreReviewController.requestReview(in: scene)
                        }
                        
                    } label: {
                        Image("swruigrb")
                    }
                    
                }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading:
                                Constants.BackBUtoncik())
    }
    
}
