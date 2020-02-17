
import Foundation

public struct ADCategory: Codable,Identifiable {
    public var id: Int
    var name: String
    var count: Int
}
public typealias Categories = [ADCategory]
