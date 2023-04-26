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
    @State var openCameraRoll = true
    @State var imageSelected = UIImage()
    
    @State var camera = false
    @State var photoLib = false
    @State var wallet = false
    
    @State var numOnes: Int = 0
    @State var ones: String = "x $1 conf: "
    @State var percentOnes: Int = 0
    
    @State var numFives: Int = 0
    @State var fives: String = "x $5 conf: "
    @State var percentFives: Int = 0
    
    @State var numTens: Int = 0
    @State var tens: String = "x $10 conf: "
    @State var percentTens: Int = 0
    
    @State var numTwenties: Int = 0
    @State var twenties: String = "x $20 conf: "
    @State var percentTwenties: Int = 0
    
    @State var numFifties: Int = 0
    @State var fifties: String = "x $50 conf: "
    @State var percentFifties: Int = 0
    
    @State var numHundreds: Int = 0
    @State var hundreds: String = "x $100 conf: "
    @State var percentHundreds: Int = 0
    
    @State var amountDetected: Int
    
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
                            //.font(.custom("Impact", size: 50).weight(.thin))
                            .font(.system(size:30, weight: .heavy, design: .default))
                        //.font(.custom("impact", size: 50))
                            .foregroundColor(Color.white)
                            .foregroundStyle(.black)
                            .background(
                                Color("darkGreen")
                            .matchedGeometryEffect(id: "background", in: namespace)
                            )
                            .cornerRadius(90)
                            .matchedGeometryEffect(id: "title", in: namespace)
                            .hapticFeedback()
                    }
                    .padding()
                }
                //---------------------------------------
                if showOption{
                    HStack{
                        VStack(spacing: 45) {
                            Text("ScanMyMoney")
                                .frame(
                                    maxWidth: .infinity,
                                    minHeight: 60,
                                    alignment: .leading)
                                .matchedGeometryEffect(id: "title", in: namespace)
                                .padding(.leading)
                            //                        .font(.system(size: 30, weight: .medium, design: .default))
                                //.font(.custom("impact", size: 30).weight(.bold))
                                .font(.system(size:30, weight: .heavy, design: .default))
                                .foregroundColor(Color.white)
                                .background(
                                    
                                    Color("darkGreen").matchedGeometryEffect(id: "background", in: namespace)
                                )
                                
                            
                            
                            Text("Choose an Option".uppercased())
                                .frame(
                                    maxWidth: .infinity,
                                    minHeight: 60,
                                    alignment: .center)
                            //                        .font(.system(size: 30, weight: .medium, design: .default))
                                .font(.title).bold()
                                .foregroundColor(Color("darkGreen"))
                            
                            
                            
                            
                            VStack(spacing: 40) {
                                SelectButtons(
                                    isSelected: $camera,
                                    color: Color("darkGreen"),
                                    text: "Camera Roll",
                                    image: "camera",
                                imagePlace: 250)
                                    .onTapGesture {
                                        camera = true
                                    if camera{
                                        startScreen = false
                                        photoLib = false
                                        wallet = false
                                    }
                                    
                                }
                                
                                SelectButtons(
                                    isSelected: $photoLib,
                                    color: Color("darkGreen"),
                                    text: "Photo Library",
                                    image: "camera",
                                    imagePlace: 250)
                                    .onTapGesture {
                                        photoLib = true
                                    if photoLib{
                                        startScreen = false
                                        camera = false
                                        wallet = false
                                    }
                                }
                                
                                SelectButtons(
                                    isSelected: $wallet,
                                    color: Color("darkGreen"),
                                    text: "Wallet",
                                    image: "banknote.fill",
                                    imagePlace: 250)
                                    .onTapGesture {
                                        wallet = true
                                    if wallet{
                                        startScreen = false
                                        camera = false
                                        photoLib = false
                                    }
                                }
                             
                            }
                            Image("MoneyIcon")
                                .resizable()
                                .foregroundColor(.accentColor)
                                .scaledToFit()
                                
                                
                            Spacer()
                        }
                        
                       
                    }
                }
            }
            .onTapGesture {
                withAnimation(.spring(response: 0.7, dampingFraction: 0.8)) {
                    showOption = true
                }
                
            }
        }
        //------------------------------------------------------
        if photoLib{
            VStack(spacing: 40) {
                Image(uiImage: imageSelected)
                    .resizable()
                    .frame(width: 250, height: 250, alignment: .center)
                HStack {
                    Text("Total Amount Detected: $")
                    Text("\(amountDetected)")
                }
                .frame(alignment: .center)
                    
                ZStack {
                    
                    
                    
                        List {
                            //                TextEditor(text: $fullText)
                            Text("BreakDown")
                            //                    .scrollContentBackground(.hidden) // <- Hide it
                            // To see this
                                .frame(minWidth: 250, minHeight: 25, alignment: .top)
                                .underline()
                                .foregroundColor(Color("darkGreen"))
                                .font(.custom("HelveticaNeue", size: 30))
                            
                                .multilineTextAlignment(.center)
                            
                            HStack(spacing: 0) {
                                Text("\(numOnes)")
                                    .frame(alignment: .center)
                                TextEditor(text: $ones)
                                    .frame(maxWidth: 150, maxHeight: 50 ,alignment: .center)
                                
                                Text("\(percentOnes)")
                                Text("%")
                            }
                            .frame(minWidth: 250, minHeight: 25, alignment: .top)
                            .foregroundColor(Color("darkGreen"))
                            .font(.custom("HelveticaNeue", size: 30))
                            .scrollDisabled(true)
                            .multilineTextAlignment(.center)
                            
                            HStack(spacing: 0) {
                                Text("\(numFives)")
                                TextEditor(text: $fives)
                                    .frame(maxWidth: 150, maxHeight: 50 ,alignment: .center)
                                Text("\(percentFives)")
                                Text("%")
                            }
                            .frame(minWidth: 250, minHeight: 25, alignment: .top)
                            .foregroundColor(Color("darkGreen"))
                            .font(.custom("HelveticaNeue", size: 30))
                            .scrollDisabled(true)
                            .multilineTextAlignment(.center)
                            
                            HStack(spacing: 0) {
                                Text("\(numTens)")
                                TextEditor(text: $tens)
                                    .frame(maxWidth: 160, maxHeight: 50 ,alignment: .center)
                                Text("\(percentTens)")
                                Text("%")
                            }
                            .frame(minWidth: 250, minHeight: 25, alignment: .top)
                            .foregroundColor(Color("darkGreen"))
                            .font(.custom("HelveticaNeue", size: 30))
                            .scrollDisabled(true)
                            .multilineTextAlignment(.center)
                            .replaceDisabled()
                            
                            HStack(spacing: 0) {
                                Text("\(numFifties)")
                                TextEditor(text: $fifties)
                                    .frame(maxWidth: 160, maxHeight: 50 ,alignment: .center)
                                Text("\(percentFifties)")
                                Text("%")
                            }
                            .frame(minWidth: 250, minHeight: 25, alignment: .top)
                            .foregroundColor(Color("darkGreen"))
                            .font(.custom("HelveticaNeue", size: 30))
                            .scrollDisabled(true)
                            .multilineTextAlignment(.center)
                            
                            HStack(spacing: 0) {
                                Text("\(numHundreds)")
                                TextEditor(text: $hundreds)
                                    .frame(maxWidth: 180, maxHeight: 50 ,alignment: .center)
                                Text("\(percentHundreds)")
                                Text("%")
                            }
                            .frame(minWidth: 250, minHeight: 25, alignment: .top)
                            .foregroundColor(Color("darkGreen"))
                            .font(.custom("HelveticaNeue", size: 30))
                            .scrollDisabled(true)
                            .multilineTextAlignment(.center)
                            
                            
                       
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color("darkGreen"))
                        
                        
                        
                }
            
                Spacer()
                
            }.sheet(isPresented: $openCameraRoll) {
                //ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
                ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                
            }
        }
        if camera{
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
                ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
                //ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                
            }
        }
        if wallet {
            
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
        ContentView(amountDetected: 40)
    }
}
