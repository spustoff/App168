//
//  CalendarViewModel.swift
//  App168
//
//  Created by IGOR on 08/08/2023.
//

import SwiftUI
import Alamofire

final class CalendarViewModel: ObservableObject {
    
    @Published var calendar_items: [CalendarModel] = []
    
    @Published var colums: [String] = ["All", "Favorites"]
    @Published var current_colum = "All"
    
    @Published var isLoading: Bool = false
    
    @AppStorage("currency_saved") var currency_saved: [String] = []
    
    func getFilteredCurrencies() -> [CalendarModel] {
        
        return calendar_items.filter{currency_saved.contains($0.resultCurrencyItem ?? "")}
    }
    
    func favoritesManager(_ valuta: CalendarModel) {
        
        guard let title = valuta.resultCurrencyItem else { return }
        
        if currency_saved.contains(title) {
            
            if let indexer = currency_saved.firstIndex(of: title) {
                
                currency_saved.remove(at: indexer)
            }
            
        } else {
            
            currency_saved.append(title)
        }
    }
    
    func isFavorited(_ valuta: CalendarModel) -> Bool {
        
        guard let title = valuta.resultCurrencyItem else { return false }
        
        return currency_saved.contains(title) ? true : false
    }
    
    func getCalendar() {
        
        isLoading = true
        
        self.fetchCalendar() { result in
            
            switch result {
                
            case .success(let success):
                
                self.calendar_items = success.results
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchCalendar(completion: @escaping (Result<CalendarResponseModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "c690d1ed-b1c3-4dd2-a682-3cf39000411b",
        ]
        
        let request = AF.request("https://rewerwy.site/api/v2/fetch/currencies", method: .get, parameters: params)
        
        request.responseDecodable(of: CalendarResponseModel.self) { response in
            
            guard let value = response.value else {
                
                print("decode error")
                print(response)
                self.isLoading = false
                return
            }
                           
            switch response.result {
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}

