//
//  ProfileView.swift
//  Miro_TastyRoad
//
//  Created by user on 2022/11/13.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(colors: [.blue, .white],
                               startPoint: .top,
                               endPoint: .bottom)
                .clipShape(Circle())
                .frame(width: 500, height: 500)
                .position(x: geo.size.width / 2, y: 0)
                
                VStack(spacing: 20) {
                    Text("UserName")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Image("user")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "person")
                        Text("Username")
                    }
                    
                    HStack {
                        Image(systemName: "calendar")
                        Text("Birthday")
                    }
                    
                    HStack {
                        Image(systemName: "phone")
                        Text("010-1234-5951")
                    }
                    
                    HStack {
                        Image(systemName: "mail")
                        Text("MailAccount")
                    }
                    
                    HStack {
                        Image(systemName: "eye")
                        Text("Password")
                    }
                    
                    Spacer()
                    
//                    Divider()
                    
                    
                    Button {
                        print("Hello")
                    } label: {
                        Label("EditProfile", systemImage: "pencil")
                    }
                }
//                .position(x: geo.size.width / 2, y: 200)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
