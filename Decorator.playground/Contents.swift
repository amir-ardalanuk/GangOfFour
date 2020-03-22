import UIKit

var str = "START"

protocol Component {
    func doSomething()
}

class ConcreteComponent: Component {
    func doSomething() {
        print("ConcreteComponent")
    }
}

class Decorator : Component {
    
    var component : Component
    
    init(_ component : Component) {
        self.component = component
    }
    
    func doSomething() {
        component.doSomething()
    }
}

class ConcreteDecoratorA : Decorator {
    override func doSomething() {
        super.doSomething()
        print("ConcreteDecoratorA >> doSomthing")
    }
}


class ConcreteDecoratorB : Decorator {
    override func doSomething() {
        super.doSomething()
        print("ConcreteDecoratorB >> doSomthing")
    }
}


struct Client {
    static func doSomthing(component : Component){
        component.doSomething()
    }
}

func test(){
    let conrete = ConcreteComponent()
    conrete.doSomething()
    
    
    let decorator = Decorator(conrete)
    
    let simpleA = ConcreteDecoratorA(decorator)
    
    let simpleB = ConcreteDecoratorB(simpleA)
    
    
    
    conrete.doSomething()
     print("EEEE >> EEEE")
    decorator.doSomething()
    print("EEEE >> EEEE")
    simpleA.doSomething()
    print("EEEE >> EEEE")
    simpleB.doSomething()
}

test()
