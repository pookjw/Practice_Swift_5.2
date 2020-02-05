import Cocoa

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
