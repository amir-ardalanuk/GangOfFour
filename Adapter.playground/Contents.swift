import UIKit

protocol CoffeMachinInterface {
    func chooseFirstSelection()
    func chooseSecondSelection()
}

struct CoffeTouchscreenAdapter : CoffeMachinInterface {
    
    var oldMachin : OldCoffeMachin!
    
    init(oldMachin : OldCoffeMachin) {
        self.oldMachin = oldMachin
    }
    func chooseFirstSelection() {
        self.oldMachin.selectA()
    }
    
    func chooseSecondSelection() {
        self.oldMachin.selectB()
    }
    
    
}

struct OldCoffeMachin {
    func selectA(){
        print("Select A")
    }
    
    func selectB(){
        print("Select B")
    }
}



