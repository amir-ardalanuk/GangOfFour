import UIKit

var str = "Hello, playground"

protocol DataIO {
    func write(data:Data)
    func read()->Data
}


class BaseDecorator: DataIO {
   
    
    var wrappee: DataIO
    
    init(_ decorator:DataIO) {
        self.wrappee = decorator
    }
    
    func write(data: Data) {
        wrappee.write(data: data)
    }
       
    func read() -> Data {
        return wrappee.read()
    }
}

class EncryptionDecorator:BaseDecorator  {
    
    override init(_ decorator:DataIO) {
        super.init(decorator)
    }
    
    override func write(data: Data) {
           //Encrypt Befor write
        super.write(data: data)
    }
       
    override func read() -> Data {
        super.read()
        //Then decrypt data
       }
}

extension Data: DataIO {
    func write(data: Data) {
        //TODO: nothings
    }
    
    func read() -> Data {
        return self
    }
}

let decorat = BaseDecorator(Data())
let encyrpting = EncryptionDecorator(decorat)
encyrpting.read()
