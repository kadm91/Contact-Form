//
//  ContentView.swift
//  Contact Form
//
//  Created by Kevin Martinez on 1/3/24.
//

import SwiftUI

struct ContactForm: View {
    
    //MARK: - Properties
    
    @State private var emailAddress = ""
    @State private var message = ""
    @State private var subject: subjectOptions = .help
    @State private var preferredContactMethod = ContactMethod.email
    @State private var phoneNumber = ""
    @State private var includeLogs = false
    
    //MARK: - ContactForm body
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("How can we reach you?") {
                    contactMethodField
                }
                
                Section ("What we can help you with") {
                    subjectField
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
            .navigationTitle(viewTitle)
        }
    }
}

//MARK: - Preview

#Preview {
    ContactForm()
}

//MARK: - ContactForm extension

extension ContactForm {
    
    var viewTitle: String { "Contact Us" }
    
    var messageField: some View {
        
        TextEditor(text: $message)
            .frame(height: 100)
        
    }
    
    var includeLogsField: some View {
        Toggle("Include Logs", isOn: $includeLogs)
    }
    
    var submitButton: some View {
        
        Section {
            Button {
                print("Submit button tapped")
            } label: {
                Text("Submit")
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                
            }
            .listRowBackground(Color.clear)
            .tint(.accentColor)
            .buttonStyle(.bordered)
        }
        
    }
    
    var subjectField: some View {
        
        Picker("Subject", selection: $subject) {
            ForEach(subjectOptions.allCases) {option in
                Text(option.rawValue.capitalized)
            }
        }
        .tint(.accentColor)
        
    }
    
    var contactMethodField: some View {
        
        
        LabeledContent {
            
            Group {
                switch preferredContactMethod {
                case .email:
                    TextField("Email Address", text: $emailAddress)
                    
                case .phone:
                    TextField("Phone Number", text: $phoneNumber)
                }
            }
            .multilineTextAlignment(.trailing)
            .frame(maxWidth: .infinity)
            
        } label: {
            
            Picker("", selection: $preferredContactMethod) {
                ForEach (ContactMethod.allCases) { method in
                    Text(method.rawValue.capitalized)
                }
            }
            //.pickerStyle(.segmented)
            .labelsHidden()
            .tint(.accentColor)
        }

        
      
    }
    
    enum subjectOptions: String ,CaseIterable ,Identifiable {
       case help
       case suggestion
       case bugReport = "Bug Report"
        
        var id: Self { self }
        
    }
    
    enum ContactMethod: String, CaseIterable, Identifiable {
        case email, phone
        
        var id: Self {self}
    }
    
}
