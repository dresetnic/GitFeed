//
//  FeedViewControllerSwiftUIView.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 21/11/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import SwiftUI

struct FeedViewControllerSwiftUIView: UIViewControllerRepresentable {
       
    func makeUIViewController(context: UIViewControllerRepresentableContext<FeedViewControllerSwiftUIView>) -> FeedViewController {
        let feedViewController = FeedViewController()
        let _ = FeedModuleInitializer(feedViewController: feedViewController)
        return feedViewController
    }
    
    func updateUIViewController(_ uiViewController: FeedViewController, context: UIViewControllerRepresentableContext<FeedViewControllerSwiftUIView>) {
        
    }
}

struct FeedViewControllerSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeedViewControllerSwiftUIView()
    }
}
