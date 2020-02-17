
import Foundation

public struct ADModel: Codable, Identifiable {
    public var id: Int
    var title: String
    var price: String
    var type: String?
    var imageUrl: String
}
