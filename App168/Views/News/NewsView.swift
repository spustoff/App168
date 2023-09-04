//
//  NewsView.swift
//  App168
//
//  Created by IGOR on 07/08/2023.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = NewsViewModel()

    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Video News")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                }
                
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
                            
                            if viewModel.lessons.isEmpty {
                                
                                VStack(spacing: 5) {
                                    
                                    Text("No Videos")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Text("No any video")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                }
                                
                            } else {
                                
                                ScrollView(.vertical, showsIndicators: false) {
                                    
                                    LazyVStack {
                                        
                                        ForEach(viewModel.lessons, id: \.self) { index in
                                            
                                            HStack {
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedLesson = index
                                                    viewModel.isDetail = true
                                                    
                                                }, label: {
                                                    
                                                    VStack {
                                                        
                                                        if let image = index.image {
                                                            
                                                            WebPic(urlString: image, width: .infinity, height: 225, cornerRadius: 15, isPlaceholder: true)
                                                                .overlay(Image("play"))
                                                        }
                                                        
                                                        VStack(alignment: .leading, spacing: 8) {
                                                            
                                                            Text("\(index.duration ?? 0) min")
                                                                .foregroundColor(.gray)
                                                                .font(.system(size: 15, weight: .regular))
                                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                            
                                                            Text(index.title ?? "")
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 26, weight: .bold))
                                                                .lineLimit(2)
                                                            
                                                            Text("News about crypto")
                                                                .foregroundColor(.gray)
                                                                .font(.system(size: 20, weight: .regular))
                                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                            
                                                            Button(action: {
                                                                
                                                                viewModel.favoritesManager(index)
                                                                
                                                            }, label: {
                                                                
                                                                Image(systemName: viewModel.isFavorited(index) ?  "star.fill" : "star")
                                                                    .foregroundColor(viewModel.isFavorited(index) ? .blue : .gray)
                                                            })
                                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                                        }
                                                    }
                                                })
                                            }
                                            .padding()
                                            .background(Color("bg2"))
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.getFilteredVideo(), id: \.self) { index in
                                    
                                    HStack {
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedLesson = index
                                            viewModel.isDetail = true
                                            
                                        }, label: {
                                            
                                            VStack {
                                                
                                                if let image = index.image {
                                                    
                                                    WebPic(urlString: image, width: .infinity, height: 225, cornerRadius: 15, isPlaceholder: true)
                                                        .overlay(Image("play"))
                                                }
                                                
                                                VStack(alignment: .leading, spacing: 8) {
                                                    
                                                    Text("\(index.duration ?? 0) min")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 15, weight: .regular))
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                    
                                                    Text(index.title ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 26, weight: .bold))
                                                        .lineLimit(2)
                                                    
                                                    Text("News about crypto")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 20, weight: .regular))
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                    
                                                    Button(action: {
                                                        
                                                        viewModel.favoritesManager(index)
                                                        
                                                    }, label: {
                                                        
                                                        Image(systemName: viewModel.isFavorited(index) ?  "star.fill" : "star")
                                                            .foregroundColor(viewModel.isFavorited(index) ? .blue : .gray)
                                                    })
                                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                                }
                                            }
                                        })
                                    }
                                    .padding()
                                    .background(Color("bg2"))
                                }
                            }
                            .padding()
                        }
                    }
            }
            .background(Color("s"))
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {

            viewModel.getCategories(category_id: "")
        }
        .sheet(isPresented: $viewModel.isDetail, content: {

            NewsDetail(index: viewModel.selectedLesson)
        })
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
