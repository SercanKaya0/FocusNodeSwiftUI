//
//  ContentView.swift
//  FocusNodeSwiftUI
//
//  Created by Sercan KAYA on 12.04.2022.
//

import SwiftUI

enum FocusedFieldType {
    case name, surname, city, age
}

struct MultipleFocusNode: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var city: String = ""
    @State private var age: String = ""

    @FocusState private var focusType: FocusedFieldType?
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Spacer()
            TextField("Name", text: $name)
                .focused($focusType, equals: .name)
                .textContentType(.name)
            TextField("Surname", text: $surname)
                .focused($focusType, equals: .surname)
                .textContentType(.givenName)
            TextField("City", text: $city)
                .focused($focusType, equals: .city)
                .textContentType(.addressCity)
            TextField("Age", text: $age)
                .focused($focusType, equals: .age)
                .textContentType(.password)
                .submitLabel(.done)
            Spacer()
        }.padding(.horizontal, 24)
            .textFieldStyle(.roundedBorder)

            .onSubmit {
                switch focusType {
                case .name:
                    focusType = .surname
                case .surname:
                    focusType = .city
                case .city:
                    focusType = .age
                case .age:
                    focusType = nil
                case .none:
                    focusType = nil
                }
            }
    }
}

struct MultipleFocusNode_Previews: PreviewProvider {
    static var previews: some View {
        MultipleFocusNode()
    }
}
