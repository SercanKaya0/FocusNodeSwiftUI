//
//  SingleFocusNode.swift
//  FocusNodeSwiftUI
//
//  Created by Sercan KAYA on 12.04.2022.
//

import SwiftUI

struct SingleFocusNode: View {
    @State private var name: String = ""
    @FocusState private var focusType: Bool
    var body: some View {
        VStack {
            Spacer()
            TextField("Email", text: $name)
                .textFieldStyle(.roundedBorder)
                .focused($focusType)
            Button("Press Focus") {
                focusType.toggle()
            }
            Spacer()
        }.padding(.horizontal, 36)
    }
}

struct SingleFocusNode_Previews: PreviewProvider {
    static var previews: some View {
        SingleFocusNode()
    }
}
