//
//  TabBar.swift
//  App168
//
//  Created by IGOR on 09/08/2023.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    @State var tabs: [Tab] = [Tab.Signals, Tab.Calendar, Tab.News, Tab.Calculator, Tab.Settings]
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {

                            
                            Image(index.rawValue)
                                .renderingMode(.template)
                                .foregroundColor(selectedTab == index ? Color("b") : Color.gray)
                            

                            Text(index.rawValue)
                                .foregroundColor(selectedTab == index ? Color("b") : Color.gray)
                                .font(.system(size: 11, weight: .semibold))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 9)
        .padding(.bottom, 40)
        .background(Color.black)
    }
}

enum Tab: String, CaseIterable {
    
    case Signals = "Signals"
    
    case Calendar = "Calendar"
    
    case News = "News"
    
    case Calculator = "Calculator"
    
    case Settings = "Settings"

}
