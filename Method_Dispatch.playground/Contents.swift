import UIKit


// MARK: - Example 1
protocol Movable {
    func walk()
    //func crawl()
}

extension Movable {
    
    func crawl() {
        print("Default crawling")
    }
    
//    func walk() {
//        print("Default walking" )
//    }
}

struct Animal: Movable {
    
    func walk() {
        print("Animal is walking")
    }
    
    func crawl() {
        print("Animal is crawling")
    }
}

let panda = Animal()
panda.walk()
panda.crawl()

let wolf: Movable = Animal()

wolf.walk()
wolf.crawl()

// MARK: - Example 2 (Bug)

protocol MyProtocol {
    func sayHello()
}

extension MyProtocol {
    
    func sayHello() {
        print("Hello protocol")
    }
}

class RootClass: MyProtocol {
    
}

class MyClass: RootClass {
    
    func sayHello() {
        print("Hello class")
    }
}

let myClassInstanse = MyClass()
let myClassInstansSecond: RootClass = MyClass()

myClassInstanse.sayHello()
myClassInstansSecond.sayHello()


// MARK: - Example Witness Table 3

protocol WitnessProtocol {
    func witnessFunc()
}

class WitnessClass: WitnessProtocol {
    
    func witnessFunc() {
        print("Method Dispatch: - Witness Table (Dynamic) Dispatch")
    }
}

let witnessClass: WitnessProtocol = WitnessClass()
witnessClass.witnessFunc()

let witnessClassSecond = WitnessClass()
witnessClassSecond.witnessFunc()

// MARK: - Example Virtual Table (Dynamic) Dispatch

class VirtualSuperClass {
    
    func virtualFunc() {
        
    }
}

class VirtualClass: VirtualSuperClass {
    
    override func virtualFunc() {
        print("Method Dispatch: - Virtual Table (Dynamic) Dispatch")
    }
}

let virtualClass: VirtualSuperClass = VirtualClass()
virtualClass.virtualFunc()

let virtualClassSecond = VirtualClass()
virtualClassSecond.virtualFunc()


// MARK: - Example Direct (Static) Dispatch

struct StaticDispatchStruct {
    
    func staticfunc() {
        print("Method Dispatch: - Direct (Static) Dispatch")
    }
}

let staticDispatchStruct = StaticDispatchStruct()
staticDispatchStruct.staticfunc()


protocol StaticProtocol {
    func tableFunc() //Method Dispatch: - Witness Table (Dynamic) Dispatch"
    
}

extension StaticProtocol {
    
    func staticFunc() {
        print("Method Dispatch: - Direct (Static) Dispatch")
    }
}

class StaticClass {
    
    func tableFunc() {
        print("Method Dispatch: - Virtual Table (Dynamic) Dispatch")
    }
    
}

extension StaticClass {
    
    func staticFunc() {
        print("Method Dispatch: - Direct (Static) Dispatch")
    }
}

// MARK: - Example Message  Dispatch


class ObjectSubClass: NSObject {
    
    func tableFunc() {
        print("Method Dispatch: - Virtual Table (Dynamic) Dispatch")
    }
}

extension ObjectSubClass {

    @objc dynamic func messageFunc() {
        print("Method Dispatch: - Message  Dispatch")
    }
}


class MyObjectClass: NSObject {
    
    @objc dynamic func messageFunc() {
        print("Method Dispatch: - Message  Dispatch")
    }
 
}

class MyObjectSubClass: MyObjectClass {

    @objc dynamic override func messageFunc() {
        print("Method Dispatch: - Message  Dispatch")
    }
}
