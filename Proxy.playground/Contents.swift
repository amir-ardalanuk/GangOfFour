import UIKit
import XCTest

protocol Subject {
    func request()
}

struct RealSubject : Subject {
    func request() {
        print("Real Subject Print")
    }
}

struct Proxy : Subject {
    
    
    var subject : RealSubject
    
    init(subject : RealSubject) {
        self.subject = subject
    }
    
    func request() {
        if(self.access()){
            self.subject.request()
            self.log()
        }
    }
    
    func access() -> Bool{
        return Bool.random()
    }
    
    func log(){
        print("Logged in Proxy")
    }
}

struct Client {
    static func clientCode(subject : Subject){
        subject.request()
    }
}
    func test() {
        print("Client: Executing the client code with a real subject:")
        let realSubject = RealSubject()
        Client.clientCode(subject: realSubject)

        print("\nClient: Executing the same client code with a proxy:")
        let proxy = Proxy(subject: realSubject)
        Client.clientCode(subject: proxy)
    }

test()
