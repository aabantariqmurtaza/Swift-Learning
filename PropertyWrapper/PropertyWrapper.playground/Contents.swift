import UIKit

@propertyWrapper
struct TrimoutSpaces {
  var wrappedValue: String {
    get {
      trimmedOutValue
    }
    set {
      trimmedOutValue = newValue.trimmingCharacters(in: .whitespaces)
    }
  }
  var trimmedOutValue: String = ""
  init(wrappedValue inputString: String) {
    wrappedValue = inputString
  }
}

struct User {
  @TrimoutSpaces var strWithoutSpace = "  I am Aaban  "
}

let user = User()
print(user.strWithoutSpace)
