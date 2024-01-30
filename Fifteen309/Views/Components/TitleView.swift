//
//  TitleView.swift
//  Fifteen309
//  Created by brfsu on 17.01.2024.
//
import SwiftUI

struct TitleView: View {
    private let text: String

    init(text: String) {
        self.text = text
    }
        
    var body: some View {
        Text(text)
            .font(.system(size: Constants.bigTitle))
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(text: "Caption")
    }
}
