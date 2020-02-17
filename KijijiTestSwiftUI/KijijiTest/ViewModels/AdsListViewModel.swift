

import Foundation

class AdsListViewModel: ObservableObject {
    @Published var adsList = [ADModel]()
    var categoryID: String
    
    init(_ category: ADCategory) {
        self.categoryID = String(category.id)
    }
    
    func load() {
        let urlString = AppConstants.urlString + "/\(categoryID)"
        guard let url = URL(string:  urlString) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
                           do {
                                guard let data = data else { return }
                                let list = try JSONDecoder().decode([ADModel].self, from: data)
                                       DispatchQueue.main.async {
                                        self.adsList = list
                                       }
                            } catch {
                                       print("Failed To decode: ", error)
                            }
            }.resume()
    }
}
