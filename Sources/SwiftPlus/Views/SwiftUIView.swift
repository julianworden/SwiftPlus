//
//  SwiftUIView.swift
//  
//
//  Created by Julian Worden on 5/8/23.
//

import SwiftUI

/// A custom TextField that disables auto correction, auto capitalization, and
/// space bar presses. Good for prompting a user to enter their username or email address, for example.
public struct OneWordTextField: View {
    @Binding var text: String

    let placeholder: String

    init(_ placeholder: String, text: Binding<String>) {
        _text = Binding(projectedValue: text)
        self.placeholder = placeholder
    }

    public var body: some View {
        TextField(placeholder, text: $text)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .onChange(of: text) { newText in
                text = newText.replacing(" ", with: "")
            }
    }
}

struct OneWordTextField_Previews: PreviewProvider {
    static var previews: some View {
        OneWordTextField("Email Address", text: .constant(""))
            .textFieldStyle(.roundedBorder)
            .padding()
    }
}
