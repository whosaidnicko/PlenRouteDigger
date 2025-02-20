//
//  Luweitubsoqsgr.swift
//  PlenRouteDigger
//
//  Created by Nicolae Chivriga on 21/02/2025.
//

import SwiftUI
import Lottie

struct Luweitubsoqsgr: View {
    private let loadingText = "LOADING..."
       // Define a set of colors. The list will cycle if there are more letters than colors.
       private let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink]
    @State private var skoqubsaq: Bool = false
       @State private var animate = false
    var body: some View {
        ZStack {
            Image(Constants.bgsquaiobgierusfi)
                .resizable()
                .ignoresSafeArea()
            VStack {
                LottieView(animation: .named("secorunboq"))
                    .playing(loopMode: .loop)
                    .resizable()
                    .frame(width: 220, height: 220)
                
                HStack(spacing: 5) {
                          ForEach(Array(loadingText.enumerated()), id: \.offset) { index, letter in
                              Text(String(letter))
                                  .font(.system(size: 50, weight: .bold, design: .rounded))
                                  .foregroundColor(colors[index % colors.count])
                                  
                                  .scaleEffect(animate ? 1.0 : 0.5)
                                  .opacity(animate ? 1 : 0.3)
                                  .offset(y: animate ? 0 : -10)
                                  // Each letter's animation is delayed for a cascading effect
                                  .animation(
                                      Animation.easeInOut(duration: 0.8)
                                          .repeatForever(autoreverses: true)
                                          .delay(Double(index) * 0.1),
                                      value: animate
                                  )
                          }
                      }
                      
            }
            NavigationLink("", destination: SiqMenubiq(), isActive: $skoqubsaq)
        }
        
        .onAppear {
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                Constants.vibr(style: .rigid)
                skoqubsaq = true 
            }
        }
        .wieurbioz()
    }
}

@preconcurrency import WebKit
import SwiftUI

struct WKWebViewRepresentable: UIViewRepresentable {
    typealias UIViewType = WKWebView

    var url: URL
    var webView: WKWebView
    var onLoadCompletion: (() -> Void)?
    

    init(url: URL, webView: WKWebView = WKWebView(), onLoadCompletion: (() -> Void)? = nil) {
        self.url = url
        self.webView = webView
        self.onLoadCompletion = onLoadCompletion
        self.webView.layer.opacity = 0 // Hide webView until content loads
    }

    func makeUIView(context: Context) -> WKWebView {
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        
        return webView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
        uiView.scrollView.isScrollEnabled = true
        uiView.scrollView.bounces = true
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

// MARK: - Coordinator
extension WKWebViewRepresentable {
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: WKWebViewRepresentable
        private var popupWebViews: [WKWebView] = []

        init(_ parent: WKWebViewRepresentable) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            // Handle popup windows
            guard navigationAction.targetFrame == nil else {
                return nil
            }

            let popupWebView = WKWebView(frame: .zero, configuration: configuration)
            popupWebView.uiDelegate = self
            popupWebView.navigationDelegate = self

            parent.webView.addSubview(popupWebView)

            popupWebView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                popupWebView.topAnchor.constraint(equalTo: parent.webView.topAnchor),
                popupWebView.bottomAnchor.constraint(equalTo: parent.webView.bottomAnchor),
                popupWebView.leadingAnchor.constraint(equalTo: parent.webView.leadingAnchor),
                popupWebView.trailingAnchor.constraint(equalTo: parent.webView.trailingAnchor)
            ])

            popupWebViews.append(popupWebView)
            return popupWebView
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Notify when the main page finishes loading
            parent.onLoadCompletion?()
            parent.webView.layer.opacity = 1 // Reveal the webView
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }

        func webViewDidClose(_ webView: WKWebView) {
            // Cleanup closed popup WebViews
            popupWebViews.removeAll { $0 == webView }
            webView.removeFromSuperview()
        }
    }
}

struct Swiper: ViewModifier {
    var onDismiss: () -> Void
    @State private var offset: CGSize = .zero

    func body(content: Content) -> some View {
        content
//            .offset(x: offset.width)
            .animation(.interactiveSpring(), value: offset)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                                      self.offset = value.translation
                                  }
                                  .onEnded { value in
                                      if value.translation.width > 70 {
                                          onDismiss()
                                  
                                      }
                                      self.offset = .zero
                                  }
            )
    }
}
extension View {
    func wieurbioz() -> some View {
        self.modifier(Jukopebuqz())
    }
}


