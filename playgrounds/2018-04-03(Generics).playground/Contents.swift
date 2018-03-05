//: Playground - noun: a place where people can play

//Example 1:
func log(values: [Int]) {
  print(values)
}

log(values: [1, 2, 3, 4])
//log(values: ["123", 1]) // This will error

func logGeneric<T>(values: T) {
  print(values)
}

logGeneric(values: [1, 2, 3, 4])
logGeneric(values: ["123", 1]) // This won't error anymore

//Returning first element in array
//Example 2:
let arr: [Any] = [1, "random string", "not this string", 2]

protocol Foo { }

extension Int: Foo { }
extension String: Foo { }

func firstIn<T>(_ array: [Any], ofType: T.Type) -> T? where T: Foo {
  return array.lazy.flatMap({ $0 as? T }).first
}

print(firstIn(arr, ofType: Int.self))
//print(firstIn(arr, ofType: Double.self)) // This still errors as Double does not conform to Foo

//Example 3: Bonus Content
extension Sequence {
  func firstIn<T>(ofType: T.Type) -> T? where T: Foo {
    return lazy.flatMap({ $0 as? T}).first
  }
}

