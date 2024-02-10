//
//  ContentView.swift
//  PodImplementationTest
//
//  Created by Syed Wajahat Ali on 10/02/2024.
//

import SwiftUI
import ExternalPodTest

struct ContentView: View {
    @State private var bottomSheetShown = false

    var body: some View {
        ZStack {
            VStack {
                Button {
                    bottomSheetShown.toggle()
                } label: {
                    Text("Click to appear bottomSheet from SDK")
                }
            }
            if(bottomSheetShown) {
                GeometryReader { geometry in
                    BottomSheetView(
                        maxHeight: geometry.size.height,
                        offset: geometry.size.height * 0.1
                    ) {
                        Text("Appearing From SDK" )
                    }
                }.edgesIgnoringSafeArea(.all)
            }
            
            if bottomSheetShown {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        bottomSheetShown = false
                    }
            }
            
        }
    }
}

//public struct _BottomSheetView<Content: View>: View {
//    let maxHeight: CGFloat
//    let minHeight: CGFloat
//    let offset: CGFloat
//    let content: Content
//    
//    public var body: some View {
//        content
//            .frame(maxWidth: .infinity, maxHeight: maxHeight, alignment: .center)
//            .background(Color.blue)
//            .cornerRadius(16)
//            .offset(y: offset)
//    }
//    
//    public init(maxHeight: CGFloat, offset: CGFloat, @ViewBuilder content: () -> Content) {
//        self.minHeight = maxHeight
//        self.maxHeight = maxHeight
//        self.offset = offset
//        self.content = content()
//    }
//}


#Preview {
    ContentView()
}
