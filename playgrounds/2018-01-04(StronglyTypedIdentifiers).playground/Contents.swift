//: A UIKit based Playground for presenting user interface
import UIKit

// Base
func colorView(with bgColor: UIColor) -> UIView {
  let view = UIView()
  view.backgroundColor = bgColor
  view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
  return view
}

extension UIColor {
  struct Style {
    static let tomato = UIColor(red: 255, green: 91, blue: 71, alpha: 1.0)
  }
}

colorView(with: UIColor.Style.tomato)

// Step 1
struct Foo {
  typealias Identifier = String
  let id: Identifier
}

func findFoo(with id: Foo.Identifier) {
  print("found foo")
}

let foo = Foo.init(id: "123456")
findFoo(with: foo.id)
findFoo(with: "123")

// Step 2
struct GenericIdentifier<T>: RawRepresentable, Equatable {
  let rawValue: String

  init(rawValue: String) {
    self.rawValue = rawValue
  }
}

struct Bar {
  typealias Identifier = GenericIdentifier<Bar>

  let id: Identifier
}

func findBar(with id: Bar.Identifier) {
  print("found bar")
}

let barID = Bar.Identifier.init(rawValue: "123")
let bar = Bar.init(id: barID)
findBar(with: bar.id)
