import UIKit

protocol Knif {
    func sharp()
    func clean()
    func pack()
}

class KitchenKnif : Knif {
    func sharp() {
        print("sharp")
    }
    
    func clean() {
        print("clean")
    }
    
    func pack() {
        print("pack")
    }
    
    
}


class WarKnif : Knif {
    func sharp() {
        print("sharp")
    }
    
    func clean() {
        print("clean")
    }
    
    func pack() {
        print("pack")
    }
    
}

class KnifStore {
    enum KnifType {
        case war
        case kitchen
    }
    func createKnif(by type : KnifType)-> Knif? {
        var knif : Knif!
        switch type {
        case .war:
            knif = WarKnif()
        case .kitchen:
            knif = KitchenKnif()
        }
        
        knif.sharp()
        knif.clean()
        knif.pack()
        return knif
    }
}


let store = KnifStore()
let knif = store.createKnif(by: .kitchen)
knif?.pack()


//======================================================
//Mark : Factory Method ==================
//======================================================
protocol KnifStoreCreator {
    associatedtype enumType
    func createKnif(type:enumType)->Knif?
}

struct KitchenKnifStore : KnifStoreCreator {
    
    typealias enumType = KitchenKnifType
    
    
    enum KitchenKnifType {
        case salad
        case meat
    }
    
    func createKnif(type : enumType) -> Knif? {
        switch type {
        case .meat:
            return KitchenKnif()
        case .salad:
            return KitchenKnif()
        }
    }
}

let knifStore = KitchenKnifStore()
knifStore.createKnif(type: .meat)


