//
//  SingleTon.swift
//  BeerQeeper 1.1
//
//  Created by Apple on 3.11.25.
//

final class BeerQeeper {
    static let shared = BeerQeeper()
    
    var beerArray:[Beer] = []
    var positionsCount:[Int] = []
    var totalSalesBottles:[Int] = []
    var totalSalesForDay:[Double]=[]
    var totalSalesForMonth:[Double]=[]
    
    var firstPositionCount: Int = 0
    var secondPositionCount: Int = 0
    var thirdPositionCount: Int = 0
    var text = ""
    var textTotal = ""
    var quantityX = 0
    
    func createBeer () {
        var beerOne = Beer(mark: BeerEnum.heiniken, quantity: BeerQuantity.oneHudred, price: 4.50)
        var beerTwo = Beer(mark: BeerEnum.guiness, quantity: BeerQuantity.oneHudred, price: 5.50)
        var beerThree = Beer(mark: BeerEnum.tuborg, quantity: BeerQuantity.oneHudred, price: 3.50)
        
        beerArray.append(beerOne)
        beerArray.append(beerTwo)
        beerArray.append(beerThree)
    }
    func checkOut()-> String{
        for (index, beer) in beerArray.enumerated(){
            var textOne = "\(beer.mark) price \(beer.price) sold \(positionsCount[index]) btls Summ: \(Double(positionsCount[index]) * beer.price) \n"
                text += textOne
        }
        var totalSumm = Double(firstPositionCount)*beerArray[0].price+Double(secondPositionCount)*beerArray[1].price+Double(thirdPositionCount)*beerArray[2].price
        let totalText = "\nTotal summ: \(totalSumm)"
        text+=totalText
        totalSalesForDay.append(totalSumm)
        return text
    }
    
    func checkOutAll()-> String{
        for beer in beerArray{
            var textOne = "\(beer.mark) price \(beer.price) avaliable \(beer.quantity) btls \n"
            text += textOne
        }
        var totalBottles = 0
        var totalSumm:Double = 0
        for t in totalSalesForDay{
            totalSumm += t
        }
        for i in totalSalesBottles {
            totalBottles += i
        }
        let totalText = "\nTotal sales: \(totalBottles) btls summ: \(totalSumm)"
        text += totalText
        return text
    }
    
    func addArraysForTotalSales(){
        totalSalesBottles+=positionsCount
    }
    
    func createPositionsCountAarray() {
        positionsCount.append(firstPositionCount)
        positionsCount.append(secondPositionCount)
        positionsCount.append(thirdPositionCount)
    }
    
    func updateUI(){
        firstPositionCount = 0
        secondPositionCount = 0
        thirdPositionCount = 0
    }
    
    func updateText(){
        text = ""
    }
    
    func minusBeer(){
        for data in beerArray{
            if data.mark == "Heiniken" && firstPositionCount != 0{
                data.quantity -= firstPositionCount
            }
            if data.mark == "Guiness" && secondPositionCount != 0{
                data.quantity -= secondPositionCount
            }
            if data.mark == "Tuborg" && thirdPositionCount != 0{
                data.quantity -= thirdPositionCount
            }
        }
    }
}


