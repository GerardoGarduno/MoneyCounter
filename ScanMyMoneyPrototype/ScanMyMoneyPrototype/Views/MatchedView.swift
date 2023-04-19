//
//  MatchedView.swift
//  ScanMyMoneyPrototype
//
//  Created by Christopher Fabian on 4/19/23.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                VStack {
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold  ))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    .matchedGeometryEffect(id: "title", in: namespace)
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    
                }
            }
            else {
                VStack {
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold  ))
                    .frame(maxWidth: .infinity, alignment: .leading  )
                    .matchedGeometryEffect(id: "title", in: namespace)
                }
            }
        }
        .onTapGesture {
            withAnimation{
                show.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
