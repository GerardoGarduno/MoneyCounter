//
//  PhotoLibraryView.swift
//  ScanMyMoneyPrototype
//
//  Created by Christopher Fabian on 4/25/23.
//

import SwiftUI

struct PhotoLibraryView: View {
    
    @Namespace var namespace
    @State var startScreen = true
    @State var showOption = false
    @State var cameraScreen = false
    @State var changeProfileImage = false
    @State var openCameraRoll = false
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
}

struct PhotoLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoLibraryView(amountDetected: 40)
    }
}
