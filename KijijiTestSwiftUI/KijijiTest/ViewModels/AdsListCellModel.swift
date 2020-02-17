
import Foundation

public class AdsListCellModel {
    private var model: ADModel
    
    init(_ model: ADModel) {
        self.model = model
    }
    
    func getTitle() -> String {
        return model.title
    }
    
    func  getPrice() -> String {
        return model.price
    }
    
    func getType() -> String {
        return model.type ?? "Unknow"
    }
    
    func  getImageUrlString() -> String {
        
        guard var comps = URLComponents(string: model.imageUrl) else{
               return model.imageUrl
        }
        comps.scheme = "https"
        return comps.string ?? model.imageUrl
    }
    
}
