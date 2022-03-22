////
////  SwiftUIView.swift
////  Assignment1
////
////  Created by Nguyen Quang Huy on 22/3/2022.
////
//
//import SwiftUI
//
//struct CheckBoxView: View {
//    @Binding var checked: Bool
//    
//    var body: some View {
//        Image(systemName: checked ? "checkmark.square.fill" : "square")
//            .onTapGesture {
//                self.checked.toggle()
//            }
//    }
//}
//
//struct CheckBoxView_Previews: PreviewProvider {
//    struct CheckBoxViewHolder: View {
//        @State var checked = false
//        
//        var body: some View {
//            CheckBoxView(checked: $checked)
//        }
//    }
//    
//    static var previews: some View {
//        CheckBoxViewHolder()
//    }
//}
