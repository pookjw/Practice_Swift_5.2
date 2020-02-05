# Practice_Swift_5.2

Practice of new features for Swift 5.2. [Xcode 11.4 Beta Release Notes (February 5, 2020)](https://developer.apple.com/documentation/xcode_release_notes/xcode_11_4_beta_release_notes/)

## callAsFunction

```swift
/*
 You can call values of types that declare func callAsFunction methods like functions. The call syntax is shorthand for applying func callAsFunction methods.
*/

// (Structure) Battery

struct Battery {
    var current: Int
    
    func callAsFunction(_ message: String = " of battery remaining.") -> String {
        "\(current)%\(message)"
    }
}

var battery = Battery(current: 30)
battery() // 30% of battery remaining.
battery.current = 60
battery() // 60% of battery remaining.

// (Class) Weather

class Weather {
    var celsius: Int
    
    init(celsius: Int) {
        self.celsius = celsius
    }
    
    class func callAsFunction() -> String {
        return "Is this warm?"
    }
    
    func callAsFunction() -> String {
        if self.celsius > 15 {
            return "It's warm!"
        }
        return "It's cold!"
    }
}

// Weather() // Error occurs bacause callAsFunction is only for initialized type.
Weather.callAsFunction() // Is this warm?
var weather = Weather(celsius: 20)
weather() // It's warm!
weather.celsius = 10
weather() // It's cold!
```

## Subscripts

```swift
import Cocoa

/*
 Subscripts can now declare default arguments. (59012048)
*/

// (Structure) Matrix

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int = 0, column: Int = 0) -> Double { // New feature!!!
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 4, columns: 3)
matrix[] // 0 // New feature!!!
matrix[] = 6.0 // New feature!!!
matrix[0, 0] // 6
matrix[] // 6 // New feature!!!
```

## OverrideGeneric

```swift
import Cocoa

/*
 A method override can no longer have a generic signature with requirements not imposed by the base method. For example, the below code produces an error.
*/

protocol P {}
      
class Base {
    func foo<T>(arg: T) {}
}
      
class Derived: Base {
    override func foo<T>(arg: T) {} // No Error
}
      
class Derived2: Base {
    // generates an error because of the added requirement
    override func foo<T: P>(arg: T) {}
}
```
