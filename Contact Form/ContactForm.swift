//
//  ContentView.swift
//  Contact Form
//
//  Created by Kevin Martinez on 1/3/24.
//

import SwiftUI

struct ContactForm: View {
    
    @State private var emailAddress = ""
    @State private var message = ""
    @State private var includeLogs = false
    
    var body: some View {
        Form {
            Section ("How can we reach you?") {
                emailField
            }
            
            Section("Briefly explain what's going on") {
                messageField
            }
            
            Section {
                includeLogsField
            } footer: {
                Text("This information will be sent anonymously.")
            }
            submitButton
        }
    }
}

//MARK: - Preview

#Preview {
    ContactForm()
}

//MARK: - ContactForm extension

extension ContactForm {
    
    var emailField: some View {
        LabeledContent("Email Address") {
            TextField("Enter Email Address", text: $emailAddress)
                .multilineTextAlignment(.trailing)
        }
    }
    
    var messageField: some View {
        
        TextEditor(text: $message)
            .frame(height: 100)
        
    }
    
    var includeLogsField: some View {
        Toggle("Include Logs", isOn: $includeLogs)
    }
    
    var submitButton:some View {
        
        Section {
            Button {
                print("Submit button tapped")
            } label: {
                Text("Submit")
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                
            }
            .listRowBackground(Color.clear)
            .tint(.blue)
            .buttonStyle(.bordered)
        }
        
    }
    
    
    
}
