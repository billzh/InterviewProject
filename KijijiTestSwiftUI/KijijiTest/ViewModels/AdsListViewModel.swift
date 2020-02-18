

import Foundation

class AdsListViewModel: ObservableObject {
    @Published var adsList = [ADModel]()
    var categoryID: String
    @Published var isShowingAlert = false
    var error: Error?
    
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
            if let err = error {
                 DispatchQueue.main.async {
                    self.handleError(err)
                }
            } else {
                guard let data = data else {
                    let err = NSError(domain: "", code: 999, userInfo: [NSLocalizedDescriptionKey: "No data returned"]) as Error
                    DispatchQueue.main.async {
                        self.handleError(err)
                    }
                    return
                }
                do {
                    let list = try JSONDecoder().decode([ADModel].self, from: data)
                    DispatchQueue.main.async {
                        self.adsList = list
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.handleError(error)
                    }
                }
            }
            }.resume()
    }
    
    private func handleError(_ error: Error) {
        self.error = error
        isShowingAlert = true
    }
}
