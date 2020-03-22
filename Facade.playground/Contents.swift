import UIKit



protocol IAccount {
    func deposit(value : Int)
    func withdraw(value : Int)
    func transfer(to:Int,value : Int)
    func getAccountNumber()->Int
}


extension IAccount {
    func makeRandomNumber() ->Int {
        return  Int.random(in: 1000000...1000000)
    }
}

struct Chequing : IAccount {
    
    var newAccount : Int!
    
    init() {
        self.newAccount = makeRandomNumber()
    }
    
    
    func deposit(value: Int) {
        //TODO do Deposit Operation here
    }
    
    func withdraw(value: Int) {
        //TODO do Deposit Operation here
    }
    
    func transfer(to:Int,value : Int){
        //TODO do Deposit Operation here
    }
    
    func getAccountNumber() -> Int {
        //TODO do Deposit Operation here
        return newAccount
    }
    
    
}

struct Saving : IAccount {
    
    var accountNumber : Int!
    
    init() {
        accountNumber = makeRandomNumber()
    }
    
    func deposit(value: Int) {
        //TODO do Deposit Operation here
    }
    
    func withdraw(value: Int) {
        //TODO do Deposit Operation here
    }
    
    func transfer(to:Int,value : Int){
        //TODO do Deposit Operation here
    }
    
    func getAccountNumber() -> Int {
        //TODO do Deposit Operation here
        return accountNumber
    }
    
}


struct Investment : IAccount {
    
    var accountNumber : Int!
    
    init() {
        accountNumber = self.makeRandomNumber()
    }
    func deposit(value: Int) {
        //TODO do Deposit Operation here
    }
    
    func withdraw(value: Int) {
        //TODO do Deposit Operation here
    }
    
    func transfer(to:Int,value : Int){
        //TODO do Deposit Operation here
    }
    
    func getAccountNumber() -> Int {
        //TODO do Deposit Operation here
        return accountNumber
    }
    
}



// Facade class that wrap all IAccount implimented Class
class BankService {
    enum BankAccountTypeError : Error {
        case nonType
        case notFoundAnyAccount
    }
    
    enum AccountType {
        case cheque
        case save
        case invest
    }
    
    private var bankAccount : [(Int,IAccount)]!
    
    init() {
        bankAccount = []
    }
    
    func createNewAccount(type : AccountType) -> Int?{
        var account : IAccount?
        switch type {
            
        case .cheque:
            account = Chequing()
        case .save:
            account = Saving()
        case .invest:
            account = Investment()
        }
        
        guard let registerdAccount = account else {
          return nil
        }
        self.bankAccount.append((registerdAccount.getAccountNumber(),registerdAccount))
        return registerdAccount.getAccountNumber()
    }
    
    func transferMoney(from : Int,to:Int,amount:Int) {
        let fromAccount = bankAccount.first{ $0.0 == from}?.1 // find IAcount with Account
        fromAccount?.transfer(to: to, value: amount)
    }
    
}

let bankService = BankService()
let saveAccount = bankService.createNewAccount(type: .save) ?? -1
let investAccount = bankService.createNewAccount(type: .invest) ?? -1

if saveAccount > 0 && investAccount > 0 {
    bankService.transferMoney(from: saveAccount, to: investAccount, amount: 10000)
}


