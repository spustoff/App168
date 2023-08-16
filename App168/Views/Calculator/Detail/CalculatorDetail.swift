//
//  CalculatorDetail.swift
//  App168
//
//  Created by IGOR on 09/08/2023.
//

import SwiftUI

struct CalculatorDetail: View {
    
    @State private var IAString = ""
    @State private var PPString = ""
    @State private var SPString = ""
    @State private var PCString = ""
    @State private var SCString = ""
    var IA: Int { Int(IAString) ?? 0 }
    var PP: Int { Int(PPString) ?? 0 }
    var SP: Int { Int(SPString) ?? 0 }
    var PC: Int { Int(PCString) ?? 0 }
    var SC: Int { Int(SCString) ?? 0 }

    @Environment(\.presentationMode) var router
    
    @State var isResult: Bool = false
    
    let index: String
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(index)
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Investment amount")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.top)
                        
                        TextField("Investment amount", text: $IAString)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 50)
                            .padding(.horizontal)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                            .keyboardType(.decimalPad)
                        
                        Text("Purchase Price")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        TextField("Purchase Price", text: $PPString)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 50)
                            .padding(.horizontal)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                            .keyboardType(.decimalPad)
                        
                        Text("Selling Price")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        TextField("Selling Price", text: $SPString)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 50)
                            .padding(.horizontal)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                            .keyboardType(.decimalPad)
                        
                        Text("Purchase commission (Optional)")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        TextField("", text: $PCString)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 50)
                            .padding(.horizontal)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                            .keyboardType(.decimalPad)
                        
                        Text("Sales commission (Optional)")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        TextField("", text: $SCString)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 50)
                            .padding(.horizontal)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                            .keyboardType(.decimalPad)
                        
                    }
                    .padding()
                }
                .background(Color("s").ignoresSafeArea(.all, edges: .bottom))
                
                Spacer()
                
                Button(action: {
                    
                    isResult = true
                    
                }, label: {
                    
                    Text("Calculate")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                        .padding()
                        .padding(.bottom)
                })
            }
        }
        .sheet(isPresented: $isResult, content: {
            
            ResultsView()
        })
    }
    
    func calculate(IA: Int, PC: Int, PP: Int, SP: Int, SC: Int) -> Int {
        
        let c0 = IA-(IA*(PC/100))
        
        let c1 = c0 / PP
        
        let c2 = c1 * SP
        
        let c3 = c2-(c2*(SC/100))
        
        let id = c3 - c0
        
        let ip = (id/c0)*100
        
        let fs = c0 + id
        
        return c0
        
        return c1

        return c2

        return c3

        return id

        return ip
        
        return fs
    }
    
    func calculateID(IA: Int, PC: Int, PP: Int, SP: Int, SC: Int) -> Int {
        
        let id = (IA-(IA*(PC/100)))/PP*SP - (((IA-(IA*(PC/100)))/PP*SP) * (SC/100))
        
        return id
    }
    
}

struct CalculatorDetail_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorDetail(index: "BTC")
    }
}
