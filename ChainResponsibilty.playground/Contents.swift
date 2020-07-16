import UIKit

var str = "Hello, playground"
protocol RequestHandeler {
    init(next: RequestHandeler?)
    func handle(request: Any)
}

final class Handler<T>: RequestHandeler, CustomStringConvertible {
    private var nextHandler: RequestHandeler?
    
    init(next: RequestHandeler?) {
        self.nextHandler = next
    }
    
    func handle(request: Any) {
        if request is T {
            print("\(request) handled by \(self)")
        }else{
            guard let next = self.nextHandler else {
                print("reach to the end of the chain handler")
                return
            }
            next.handle(request: request)
            print("\(request) can't handle by \(self) - forward to \(next)")
        }
    }
    
    var description: String {
        return "\(T.self) Handler"
    }
}

let dateHandler = Handler<Date>(next: nil)
let dataHandler = Handler<Data>(next: dateHandler)
let stringHandler = Handler<String>(next: dataHandler)
let intHandler = Handler<Int>(next: stringHandler)

let date = Date()
let intValue = 2
let data = Data(repeating: 0, count: 10)

intHandler.handle(request: date)
print("/////// \n ////// ")
intHandler.handle(request: data)

