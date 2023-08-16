//
//  CalendarView.swift
//  App168
//
//  Created by IGOR on 08/08/2023.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = CalendarViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Calendar")
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .medium))
                
                VStack {
                    
                    HStack {
                        
                        ForEach(viewModel.colums, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.current_colum = index
                                
                            }, label: {
                                
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(RoundedRectangle(cornerRadius: 8).fill(viewModel.current_colum == index ? Color.white.opacity(0.3) : Color.white.opacity(0)))
                                
                            })
                        }
                    }
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray.opacity(0.3)))
                    .padding(9)
                    
                    if viewModel.current_colum == "All" {
                        
                        if viewModel.isLoading {
                            
                            ProgressView()
                                .frame(maxHeight: .infinity, alignment: .center)
                            
                        } else {
                            
                            if viewModel.calendar_items.isEmpty {
                                
                                VStack {
                                    
                                    Text("empty")
                                        .foregroundColor(.white)
                                }
                                .frame(maxHeight: .infinity, alignment: .center)
                                
                            } else {
                                
                                ScrollView(.vertical, showsIndicators: true) {
                                    
                                    LazyVStack {
                                        
                                        ForEach(viewModel.calendar_items, id: \.self) { index in
                                            
                                            VStack {
                                                
                                                HStack {
                                                    
                                                    Text(index.resultCurrencyItem ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 20, weight: .semibold))
                                                    
                                                    Spacer()
                                                    
                                                    Text(index.resultCreated_atItem ?? "")
                                                        .foregroundColor(.gray)
                                                        .frame(width: 130)
                                                        .lineLimit(1)
                                                }
                                                
                                                HStack {
                                                    
                                                    VStack(alignment: .leading, spacing: 5) {
                                                        
                                                        Text("Buy")
                                                            .foregroundColor(.gray)
                                                            .font(.system(size: 13, weight: .regular))
                                                        
                                                        Text("\(index.resultBuyItem ?? 0)")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 16, weight: .semibold))
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    VStack(alignment: .leading, spacing: 5) {
                                                        
                                                        Text("Sell")
                                                            .foregroundColor(.gray)
                                                            .font(.system(size: 13, weight: .regular))
                                                        
                                                        Text("\(index.resultSellItem ?? 0)")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 16, weight: .semibold))
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    VStack(alignment: .leading, spacing: 5) {
                                                        
                                                        Text("ID")
                                                            .foregroundColor(.gray)
                                                            .font(.system(size: 13, weight: .regular))
                                                        
                                                        Text("\(index.resultIdItem ?? 0)")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 16, weight: .semibold))
                                                    }
                                                }
                                                
                                                HStack {
                                                    
                                                    Spacer()
                                                    
                                                    Button(action: {
                                                        
                                                        viewModel.favoritesManager(index)
                                                        
                                                    }, label: {
                                                        
                                                        Image(systemName: viewModel.isFavorited(index) ?  "star.fill" : "star")
                                                            .foregroundColor(viewModel.isFavorited(index) ? .blue : .gray)
                                                    })
                                                }
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(Color("bg2"))
                                            .padding(.horizontal)
                                            
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.getFilteredCurrencies(), id: \.self) { index in
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Text(index.resultCurrencyItem ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .semibold))
                                            
                                            Spacer()
                                            
                                            Text(index.resultCreated_atItem ?? "")
                                                .foregroundColor(.gray)
                                                .frame(width: 130)
                                        }
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                
                                                Text("Buy")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text("\(index.resultBuyItem ?? 0)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .semibold))
                                            }
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                
                                                Text("Sell")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text("\(index.resultSellItem ?? 0)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .semibold))
                                            }
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .leading, spacing: 5) {
                                                
                                                Text("ID")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text("\(index.resultIdItem ?? 0)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .semibold))
                                            }
                                        }
                                        
                                        HStack {
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                
                                                viewModel.favoritesManager(index)
                                                
                                            }, label: {
                                                
                                                Image(systemName: viewModel.isFavorited(index) ?  "star.fill" : "star")
                                                    .foregroundColor(viewModel.isFavorited(index) ? .blue : .gray)
                                            })
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color("bg"))
                                    .padding(.horizontal)
                                    
                                }
                            }
                        }
                    }
                }
                .background(Color("s"))
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .onAppear {
            
            viewModel.getCalendar()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
