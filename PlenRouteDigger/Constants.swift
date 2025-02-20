//
//  Constants.swift
//  PlenRouteDigger
//
//  Created by Nicolae Chivriga on 21/02/2025.
//

import SwiftUI
struct Constants {
    static var bgsquaiobgierusfi = "squaiobgierus"
    static var oflqlotgvsqi = "oflqlotgv"
    
    static func vibr(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: style)
        feedbackGenerator.impactOccurred()
        
    }
    
    struct BackBUtoncik: View {
        @Environment(\.dismiss) var dismiss
        var body: some View {
            Button {
                self.dismiss()
            } label: {
                Image("quizobptqw")
            }

        }
    }
}
