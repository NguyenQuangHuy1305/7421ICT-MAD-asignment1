//
//  NoItemsView.swift
//  Assignment1
//
//  Created by Nguyen Quang Huy on 26/3/2022.
//

import SwiftUI

struct NoItemsView: View {
    var body: some View {
        ScrollView{
            VStack {
                Text("There are no items!")
                    .font(.title)
                Text("Nothing to show here, please add something")
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add a new item!")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                )
            }
            .multilineTextAlignment(.center)
            .padding(40)
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
        }
    }
}
