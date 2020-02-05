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
