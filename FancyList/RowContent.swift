//
//  RowContent.swift
//  FancyList
//
//  Created by Larry Mcdowell on 2/21/21.
//

import Foundation
import SwiftUI

struct Loader: View {
    var body: some View {
        Group {
            ProgressView("Loading…")
                .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
        }
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
    }
}

enum RowStatus {
    case centered
    case lockedLeft
    case lockedRight
}

struct RowContent : View {
    @State var rowStatus:RowStatus = .centered
    let text : String
    let index : Int
    let buttonWidth : CGFloat = 60
    let leftButtonsCount: Int = 1
    let rightButtonsCount: Int = 2
    
    
    @Binding var indices : [Int]
    @State var offset = CGSize.zero
    @State var offsetY : CGFloat = 0
    @State var scale : CGFloat = 0.5
    
    var body : some View {
        GeometryReader { geo in
           HStack (spacing : 0){
            ZStack {
                Image(systemName: "checkmark.square")
                    .font(.system(size: 20))
                    .scaleEffect(scale)
                }
                .frame(width:buttonWidth, height: geo.size.height)
                .background(Color.green.opacity(0.15))
                .onTapGesture {
                    print("checked")
                }
             Text(text)
               .padding()
               .frame(width : geo.size.width, alignment: .leading)
                       
             ZStack {
               Image(systemName: "trash")
                 .font(.system(size: 20))
                 .scaleEffect(scale)
              }
               .frame(width: buttonWidth, height: geo.size.height)
               .background(Color.purple.opacity(0.15))
               .onTapGesture {
                   indices.append(index)
                }
            ZStack {
               Image(systemName: "app.gift.fill")
                   .font(.system(size: 20))
                   .overlay(
                       Image(systemName: "heart.fill")
                           .font(.system(size: 10))
                           .offset(y: self.offsetY)
                   )
               }
                   .frame(width: buttonWidth, height: geo.size.height)
                   .background(Color.red.opacity(0.15))
                   .onTapGesture {
                       // Do Something
                   }

           }.onAppear{
            self.offset.width = -60
           }
             .background(Color.secondary.opacity(0.1))
           .offset(self.offset)
           .animation(.spring())
           .gesture(DragGesture()
                 .onChanged { gesture in
                                self.offset.width = gesture.translation.width
                             }
                 .onEnded { _ in
                            if self.offset.width < -120 {
                                self.scale = 1
                                if self.rowStatus == .lockedRight{
                                    self.offset.width = -60
                                }else{
                                    self.offset.width = -buttonWidth * CGFloat(rightButtonsCount)//-180//-120
                                }
                                
                                self.offsetY = -20
                                self.rowStatus = .lockedLeft
                            } else if self.offset.width > 35 {
                                self.scale = 1
                                if self.rowStatus == .lockedLeft {
                                    self.offset.width = -60
                                }else{
                                    self.offset.width = 0
                                }
                              
                                self.offsetY = 0
                                self.rowStatus = .lockedRight
                            } else {
                                self.scale = 0.5
                               // self.offset = .zero
                                self.offset.width = -60
                                self.offsetY = 0
                                self.rowStatus = .centered
                            }
                          }
                   )
         }
        
    }
}
