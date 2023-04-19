//
//  ContentView.swift
//  ScanMyMoneyPrototype
//
//  Created by Christopher Fabian on 4/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @Namespace var namespace
    @State var startScreen = true
    @State var showOption = false
    @State var cameraScreen = false
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        
        if startScreen {
            ZStack {
                if !showOption {
                    VStack {
                        Image("MoneyIcon")
                            .imageScale(.medium)
                            .foregroundColor(.accentColor)
                        
                            .scaledToFit()
                        Text("ScanMyMoney")
                        //.multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .bold()
                            .font(.custom("Impact", size: 50).weight(.thin))
                        //.font(.custom("impact", size: 50))
                            .foregroundColor(Color.white)
                            .foregroundStyle(.black)
                            .background(
                                Color.green.matchedGeometryEffect(id: "background", in: namespace)
                            )
                            .matchedGeometryEffect(id: "title", in: namespace)
                            .hapticFeedback()
                    }
                    .padding()
                }
                //---------------------------------------
                if showOption{
                    VStack {
                        Text("ScanMyMoney")
                            .frame(
                                maxWidth: .infinity,
                                minHeight: 60,
                                alignment: .leading)
                            .matchedGeometryEffect(id: "title", in: namespace)
                        //                        .font(.system(size: 30, weight: .medium, design: .default))
                            .font(.custom("impact", size: 30).weight(.bold))
                            .foregroundColor(Color.white)
                            .background(
                                
                                Color.green.matchedGeometryEffect(id: "background", in: namespace)
                            )
                        Spacer()
                        Button("Click Here") {
                            //changeProfileImage = true
                            cameraScreen = true
                            startScreen = false
                        }
                        
                    }
                }
            }
            .onTapGesture {
                withAnimation(.spring(response: 0.7, dampingFraction: 0.8)) {
                    showOption.toggle()
                }
                
            }
        }
        //------------------------------------------------------
        if cameraScreen{
            ZStack(alignment: .bottomTrailing) {
                Button(action: {
                                changeProfileImage = true
                                openCameraRoll = true
                                
                            }, label: {
                                if changeProfileImage {
                                    Image(uiImage: imageSelected)
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .clipShape(Circle())
                                } else {
                                    Image("MoneyIcon")
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .clipShape(Circle())
                                }
                        })
                Image(systemName: "plus")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .clipShape(Circle())
            }.sheet(isPresented: $openCameraRoll) {
                //ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
                ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                
            }
        }
    } // -- body
} // -- struct


extension View{
    func hapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) -> some View {
        self.onTapGesture {
            let impact = UIImpactFeedbackGenerator(style: .heavy)
            impact.impactOccurred()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
