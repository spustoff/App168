//
//  Contacts.swift
//  App168
//
//  Created by Вячеслав on 9/4/23.
//

import SwiftUI
import Alamofire

struct Contacts: View {
    
    @StateObject var viewModel = ContactsViewModel()
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            if let contact = viewModel.contact {
                
                VStack {
                    
                    HStack(spacing: 0) {
                        
                        WebPic(urlString: contact.logo ?? "", width: 90, height: 90, cornerRadius: 0, isPlaceholder: false)
                        
                        Text(contact.brand ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 21, weight: .bold))
                    }
                    
                    WebPic(urlString: contact.photo ?? "", width: .infinity, height: 400, cornerRadius: 0, isPlaceholder: false)
                    
                    HStack {
                        
                        Text(contact.contactName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Circle()
                            .fill(.green)
                            .frame(width: 8, height: 8)
                        
                        Text("Online")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    .padding(.top, 5)
                    
                    VStack(spacing: 6, content: {
                        
                        Text(contact.contactHeader ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 21, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text(contact.contactSubHeader ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                        
                    })
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSocials = true
                        }
                        
                    }, label: {
                        
                        Text(contact.buttonTitle ?? "Get Contacts")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 24/255, green: 103/255, blue: 221/255)))
                            .padding()
                    })
                }
                
            } else {
                
                ProgressView()
                    .frame(maxHeight: .infinity, alignment: .center)
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .padding(11)
                            .background(Circle().fill(.gray.opacity(0.3)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
        .overlay (
            
            ZStack {
                
                Color.black.opacity(viewModel.isSocials ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSocials = false
                        }
                    }
                
                VStack {
                    
                    Text("Get Contacts")
                        .foregroundColor(.white)
                        .font(.system(size: 19, weight: .semibold))
                        .padding(.bottom)
                    
                    if let contactLinks = viewModel.contact?.contactLinks {
                        
                        let linksArray = Mirror(reflecting: contactLinks).children.compactMap { (label, value) in
                            
                            return (label, value as? String)
                        }
                        
                        ForEach(linksArray.filter{!($0.1 ?? "").isEmpty}, id: \.0) { (label, link) in
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isSocials = false
                                }
                                
                                guard let url = URL(string: link ?? "") else { return }
                                
                                UIApplication.shared.open(url)
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(label ?? "")
                                    
                                    Text(label?.capitalized ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                }
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg").ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isSocials ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchContact()
        }
    }
}

struct ContactsModel: Codable, Hashable {
    
    let id: Int?
    let code, logo, photo, brand, contactName, contactHeader, contactSubHeader, buttonTitle: String?
    let contactLinks: ContactLinks?
    
    struct ContactLinks: Codable, Hashable {
        
        let tg, vk, custom1, custom2, facebook, whatsapp, instagram: String?
    }
}

class ContactsViewModel: ObservableObject {
    
    @Published var isSocials: Bool = false
    @Published var isLoading: Bool = false
    @Published var contact: ContactsModel?
    
    func fetchContact() {
        
        isLoading = true
        
        let params: Parameters = [
            
            "lang": "en",
            "token": "c690d1ed-b1c3-4dd2-a682-3cf39000411b",
        ]
        
        let request = AF.request("https://rewerwy.site/api/v2/contact/pocket168", method: .get, parameters: params)
        
        request.responseDecodable(of: ContactsModel.self) { response in
            
            guard response.value != nil else {
                
                self.isLoading = false
                
                return
            }
            
            switch response.result{
                
            case .success(_):
                
                self.contact = response.value
                self.isLoading = false
                
            case .failure(_):
                
                self.isLoading = false
            }
        }
    }
}

struct Contacts_Previews: PreviewProvider {
    static var previews: some View {
        Contacts()
    }
}
