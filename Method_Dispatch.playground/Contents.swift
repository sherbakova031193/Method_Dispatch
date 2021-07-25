import UIKit


//MARK: - Example 1
protocol Movable {
    func walk()
    //func crawl()
}

extension Movable {
    
    func crawl() {
        print("Default crawling")
    }
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
