//
//  ContentView.swift
//  ChatGPTApp
//
//  Created by veer kalaria on 05/04/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            ScrollView{
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                    messageView(message: message )
                }
            }
            HStack{
                TextField("Enter a message...",text: $viewModel.currentInput)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(12)
                Button{
                    viewModel.sendMessage()
                }label: {
                    Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(12)
                }
            }
        }
        .padding()
    }
    func messageView(message: Message) -> some View{
        HStack{
            if message.role == .user { Spacer()}
            Text(message.content)
                .foregroundColor(message.role == .user ? Color.white : .black)
                .padding()
                .background(message.role == .user ? Color.blue : .gray.opacity(0.2))
                .cornerRadius(16)
            if message.role == .assistant { Spacer()}
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
