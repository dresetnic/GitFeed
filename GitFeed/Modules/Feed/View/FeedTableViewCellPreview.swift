//
//  FeedTableViewCellPreview.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 14/10/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import SwiftUI

struct FeedTableViewCellPreview: PreviewProvider, UIViewRepresentable {

    // MARK: PreviewProvider
    
    static var previews: some View{
        FeedTableViewCellPreview()
    }
    
    //MARK: UIViewRepresentable
    typealias UIViewType = GFFeedTableViewCell
    
    func makeUIView(context: UIViewRepresentableContext<FeedTableViewCellPreview>) -> GFFeedTableViewCell {
        let cell = GFFeedTableViewCell()
        cell.setupWith(GFEvent.example)
        return cell
    }
    
    func updateUIView(_ uiView: GFFeedTableViewCell, context: UIViewRepresentableContext<FeedTableViewCellPreview>) {
    }
}
