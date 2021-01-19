import UIKit
import Firebase

struct User {
    var name: String = ""
    var age: Int = 0
    var favoriteFood: String = ""

    /// Dictionaryから、自分自身に代入します。
    /// - Parameter dictionary: User型
    mutating func setFromDictionary(_ dictionary: [String: Any]) {
        name = dictionary["name"] as? String ?? ""
        age = dictionary["age"] as? Int ?? 0
        favoriteFood = dictionary["favoriteFood"] as? String ?? ""
    }
    
    /// Dictionaryに変換します。
    var toDictionary: [String: Any] {
        return [
            "name": name,
            "age": age,
            "favoriteFood": favoriteFood
        ]
    }
}
