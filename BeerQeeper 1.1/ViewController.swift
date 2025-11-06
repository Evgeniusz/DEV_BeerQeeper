//  ViewController.swift
//  BeerQeeper 1.1
//  Created by Apple on 3.11.25.
import UIKit

class ViewController: UIViewController {
    var screen = UIScreen.main.bounds.size
    let zeroPointX = 0
    var zeroPointY = 50
    var standartDimensionsX = 300
    var standartFrameResultYeight = 150
    var standartLabelHight = 30
    var standartLabelFont: CGFloat = 24
    var bigLabelFont: CGFloat = 80
    var indent = 35
    let smallIndent = 5
    var logoCountHeight = 85
    
    private var firstNameOfBeerAvailiable: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var secondNameOfBeerAvaliable: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var thirdNameOfBeerAvailiable: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var labelPurcaseCount: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let firstBeerLabelCount: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let secondBeerLabelCount: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let thirdBeerLabelCount: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let buttonOpenSceneOutlet: UIButton = {
        let button = UIButton()
        button.setTitle("Open", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private let buttonSellPurchasesOutlet: UIButton = {
        let button = UIButton()
        button.setTitle("Sell", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    private let buttonCloseSceneOutlet: UIButton = {
        let button = UIButton()
        button.setTitle("Close day", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private let hiddenButton: UIButton = {
        let button = UIButton()
        button.setTitle("New day", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    private let minusOne: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let minusTwo: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let minusThree: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let addOne: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let addTwo: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let addThree: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.start()
        // Do any additional setup after loading the view.
    }
   
    func minusPlus(sender: UIButton){
        let action = UIAction { _ in
            self.addPurchases(sender: sender)
            if self.labelPurcaseCount.text?.contains("Heiniken price \(BeerQeeper.shared.beerArray[0].price) sold ") == true{
                self.labelPurcaseCount.text = "Please select beer"
                BeerQeeper.shared.positionsCount=[]
            }
        }
        sender.addAction(action, for: .touchUpInside)
    }
    
    func openSceneButton(sender: UIButton) {
        let action = UIAction { _ in
            self.openSceneButtonFunc()
        }
        sender.addAction(action, for: .touchUpInside)
    }
    
    func sellButton (sender: UIButton) {
        let action = UIAction { _ in
            self.sellButton()
        }
        sender.addAction(action, for: .touchUpInside)
    }
    
    func closeDayButton(sender: UIButton){
        let action = UIAction { _ in
            self.closeDay()
        }
        sender.addAction(action, for: .touchUpInside)
    }
    
    func resetScene(sender: UIButton){
        let action = UIAction { _ in
            self.resetDay()
        }
        sender.addAction(action, for: .touchUpInside)
    }
    
    fileprivate func minusPlusRefactor() {
        self.minusPlus(sender: addOne)
        self.minusPlus(sender: addTwo)
        self.minusPlus(sender: addThree)
        self.minusPlus(sender: minusOne)
        self.minusPlus(sender: minusTwo)
        self.minusPlus(sender: minusThree)
    }
    
    func openSceneButtonFunc(){
        buttonOpenSceneOutlet.isEnabled = false
        buttonOpenSceneOutlet.setTitleColor(.lightGray, for: .normal)
        buttonSellPurchasesOutlet.isEnabled = true
        buttonCloseSceneOutlet.isEnabled = true
        buttonSellPurchasesOutlet.backgroundColor = .red
        buttonCloseSceneOutlet.setTitleColor(.black, for: .normal)
        addOne.isEnabled = true
        addTwo.isEnabled = true
        addThree.isEnabled = true
        minusOne.isEnabled = true
        minusTwo.isEnabled = true
        minusThree.isEnabled = true
        labelPurcaseCount.text = "Select Products quantity"
    }
    
    func start() {
        self.screenSizes()
        self.createArray()
        minusPlusRefactor()
        view.addSubview(firstNameOfBeerAvailiable)
        firstNameOfBeerAvailiable.frame = CGRect(x:(Int(screen.width) - standartDimensionsX)/2 , y: zeroPointY, width:standartDimensionsX, height: standartLabelHight)
        firstNameOfBeerAvailiable.text = BeerQeeper.shared.beerArray[0].mark
        self.textSizesForLabels(sender: firstNameOfBeerAvailiable)
        view.addSubview(firstBeerLabelCount)
        firstBeerLabelCount.frame = CGRect(x: (Int(screen.width) - standartDimensionsX/3)/2, y: zeroPointY+indent, width: standartDimensionsX/3, height: logoCountHeight)
        self.txtSizeForPurchaseLabelCount(sender: firstBeerLabelCount)
        firstBeerLabelCount.text = "\(BeerQeeper.shared.firstPositionCount)"
        view.addSubview(secondNameOfBeerAvaliable)
        secondNameOfBeerAvaliable.text = "\(BeerQeeper.shared.beerArray[1].mark)"
        self.textSizesForLabels(sender: secondNameOfBeerAvaliable)
        secondNameOfBeerAvaliable.frame = CGRect(x: (Int(screen.width) - standartDimensionsX)/2, y: Int(firstBeerLabelCount.frame.origin.y)+indent+logoCountHeight, width: standartDimensionsX, height: standartLabelHight)
        view.addSubview(secondBeerLabelCount)
        self.txtSizeForPurchaseLabelCount(sender: secondBeerLabelCount)
        secondBeerLabelCount.frame = CGRect(x: (Int(screen.width) - standartDimensionsX/3)/2, y: Int(secondNameOfBeerAvaliable.frame.origin.y)+indent+standartLabelHight, width: standartDimensionsX/3, height: logoCountHeight)
        secondBeerLabelCount.text = "\(BeerQeeper.shared.secondPositionCount)"
        view.addSubview(thirdNameOfBeerAvailiable)
        thirdNameOfBeerAvailiable.text = "\(BeerQeeper.shared.beerArray[2].mark)"
        self.textSizesForLabels(sender: thirdNameOfBeerAvailiable)
        thirdNameOfBeerAvailiable.frame = CGRect(x: (Int(screen.width) - standartDimensionsX)/2, y: Int(secondBeerLabelCount.frame.origin.y)+indent+logoCountHeight, width: standartDimensionsX, height: standartLabelHight)
        view.addSubview(thirdBeerLabelCount)
        thirdBeerLabelCount.text = "\(BeerQeeper.shared.thirdPositionCount)"
        self.txtSizeForPurchaseLabelCount(sender: thirdBeerLabelCount)
        thirdBeerLabelCount.frame = CGRect(x: (Int(screen.width) - standartDimensionsX/3)/2, y: Int(thirdNameOfBeerAvailiable.frame.origin.y)+indent+standartLabelHight, width: standartDimensionsX/3, height: logoCountHeight)
        view.addSubview(labelPurcaseCount)
        labelPurcaseCount.numberOfLines = 0
        labelPurcaseCount.textAlignment = .left
        labelPurcaseCount.text = "Please Open session"
        labelPurcaseCount.font = .systemFont(ofSize: 14, weight: .semibold)
        labelPurcaseCount.frame = CGRect(x: (Int(screen.width) - standartDimensionsX)/2, y: Int(thirdBeerLabelCount.frame.origin.y)+logoCountHeight, width: standartDimensionsX, height: standartFrameResultYeight)
        view.addSubview(buttonOpenSceneOutlet)
        view.addSubview(buttonSellPurchasesOutlet)
        view.addSubview(buttonCloseSceneOutlet)
        buttonOpenSceneOutlet.frame = CGRect(x: (Int(screen.width) - standartDimensionsX)/2, y: Int(thirdBeerLabelCount.frame.origin.y) + indent + standartFrameResultYeight + zeroPointY, width: standartDimensionsX, height: standartLabelHight)
        buttonSellPurchasesOutlet.frame = CGRect(x: (Int(screen.width) - standartDimensionsX)/2, y: (Int(buttonOpenSceneOutlet.frame.origin.y) + smallIndent + standartLabelHight), width: standartDimensionsX, height: standartLabelHight)
        buttonCloseSceneOutlet.frame = CGRect(x: (Int(screen.width) - standartDimensionsX)/2, y: Int(buttonSellPurchasesOutlet.frame.origin.y) + smallIndent + standartLabelHight, width: standartDimensionsX, height: standartLabelHight)
        view.addSubview(minusOne)
        view.addSubview(minusTwo)
        view.addSubview(minusThree)
        view.addSubview(addOne)
        view.addSubview(addTwo)
        view.addSubview(addThree)
        minusOne.frame = CGRect(x: Int(screen.width) / 6, y: (Int(firstBeerLabelCount.frame.origin.y) + (logoCountHeight / 2)), width: standartLabelHight, height: standartLabelHight)
        minusTwo.frame = CGRect(x: Int(screen.width) / 6, y: (Int(secondBeerLabelCount.frame.origin.y) + (logoCountHeight / 2)), width: standartLabelHight, height: standartLabelHight)
        minusThree.frame = CGRect(x: Int(screen.width) / 6, y: (Int(thirdBeerLabelCount.frame.origin.y) + (logoCountHeight / 2)), width: standartLabelHight, height: standartLabelHight)
        addOne.frame = CGRect(x: Int(screen.width) - (Int(screen.width) / 4), y: (Int(firstBeerLabelCount.frame.origin.y) + (logoCountHeight / 2)), width: standartLabelHight, height: standartLabelHight)
        addTwo.frame = CGRect(x: Int(screen.width) - (Int(screen.width) / 4), y: (Int(secondBeerLabelCount.frame.origin.y) + (logoCountHeight / 2)), width: standartLabelHight, height: standartLabelHight)
        addThree.frame = CGRect(x: Int(screen.width) - (Int(screen.width) / 4), y: (Int(thirdBeerLabelCount.frame.origin.y) + (logoCountHeight / 2)), width: standartLabelHight, height: standartLabelHight)
        self.buttons()
        self.openSceneButton(sender: buttonOpenSceneOutlet)
        self.sellButton(sender: buttonSellPurchasesOutlet)
        self.closeDayButton(sender: buttonCloseSceneOutlet)
    }
    
    func secondStart() {
        self.buttons()
        self.openSceneButton(sender: buttonOpenSceneOutlet)
    }
    
    func textSizesForLabels (sender: UILabel) -> UILabel {
        sender.textAlignment = .left
        sender.font = .systemFont(ofSize: standartLabelFont, weight: .bold)
        sender.textColor = .black
        sender.numberOfLines = 0
        return sender
    }
    
    func txtSizeForPurchaseLabelCount(sender: UILabel) -> UILabel{
        sender.textAlignment = .center
        sender.font = .systemFont(ofSize: bigLabelFont, weight: .bold)
        sender.textColor = .black
        sender.numberOfLines = 0
        return sender
    }
    
    func buttonDimensions (sender: UIButton) -> UIButton {
        return sender
    }
    
    func screenSizes() {
        if screen.width > 400 {
            standartDimensionsX = 380
        } else if screen.width < 400 {
            standartDimensionsX = 300
            zeroPointY = 30
            standartDimensionsX = 300
            standartFrameResultYeight = 150
            standartLabelHight = 25
            standartLabelFont = 20
            bigLabelFont = 60
            indent = 25
            logoCountHeight = 70
        }
    }
    
    func buttons() {
        buttonOpenSceneOutlet.isEnabled = true
        buttonCloseSceneOutlet.isEnabled = false
        buttonCloseSceneOutlet.isEnabled = false
        buttonSellPurchasesOutlet.backgroundColor = .lightGray
        buttonCloseSceneOutlet.setTitleColor(.lightGray, for: .normal)
        addOne.isEnabled = false
        addTwo.isEnabled = false
        addThree.isEnabled = false
        minusOne.isEnabled = false
        minusTwo.isEnabled = false
        minusThree.isEnabled = false
    }
    
    func createArray(){
        if BeerQeeper.shared.beerArray.isEmpty {
            BeerQeeper.shared.createBeer()
        } else {
            return
        }
    }
    
    func addPurchases(sender: UIButton!){
            switch sender {
            case addOne:
                if BeerQeeper.shared.firstPositionCount < BeerQeeper.shared.beerArray[0].quantity {
                    BeerQeeper.shared.firstPositionCount+=1
                    firstBeerLabelCount.text = "\(BeerQeeper.shared.firstPositionCount)"
                }
                else {
                    return
                }
            case addTwo:
                if BeerQeeper.shared.secondPositionCount < BeerQeeper.shared.beerArray[1].quantity {
                    BeerQeeper.shared.secondPositionCount+=1
                    secondBeerLabelCount.text = "\(BeerQeeper.shared.secondPositionCount)"
                }
                else {
                    return
                }
            case addThree:
                if BeerQeeper.shared.thirdPositionCount < BeerQeeper.shared.beerArray[2].quantity {
                    BeerQeeper.shared.thirdPositionCount+=1
                    thirdBeerLabelCount.text = "\(BeerQeeper.shared.thirdPositionCount)"
                }
                else {
                    return
                }
            case minusOne:
                if BeerQeeper.shared.firstPositionCount != 0 && BeerQeeper.shared.beerArray[0].quantity != 0 && BeerQeeper.shared.firstPositionCount <= BeerQeeper.shared.beerArray[0].quantity {
                    BeerQeeper.shared.firstPositionCount-=1
                    firstBeerLabelCount.text = "\(BeerQeeper.shared.firstPositionCount)"
                } else {
                    return
                }
            case minusTwo:
                if BeerQeeper.shared.secondPositionCount != 0 && BeerQeeper.shared.beerArray[2].quantity != 0 && BeerQeeper.shared.secondPositionCount <= BeerQeeper.shared.beerArray[2].quantity {
                    BeerQeeper.shared.secondPositionCount-=1
                    secondBeerLabelCount.text = "\(BeerQeeper.shared.secondPositionCount)"
                } else {
                    return
                }
            case minusThree:
                if BeerQeeper.shared.thirdPositionCount != 0 && BeerQeeper.shared.beerArray[2].quantity != 0 && BeerQeeper.shared.thirdPositionCount <= BeerQeeper.shared.beerArray[2].quantity {
                    BeerQeeper.shared.thirdPositionCount-=1
                    thirdBeerLabelCount.text = "\(BeerQeeper.shared.thirdPositionCount)"
                } else {
                    return
                }
            default:
                return
            }
    }
    
    func sellButton(){
        BeerQeeper.shared.createPositionsCountAarray()
        BeerQeeper.shared.minusBeer()
        labelPurcaseCount.text = "\(BeerQeeper.shared.checkOut())"
        BeerQeeper.shared.addArraysForTotalSales()
        BeerQeeper.shared.updateUI()
        BeerQeeper.shared.updateText()
        self.labels()
    }
    
    func labels(){
        firstBeerLabelCount.text = "\(BeerQeeper.shared.firstPositionCount)"
        secondBeerLabelCount.text = "\(BeerQeeper.shared.secondPositionCount)"
        thirdBeerLabelCount.text = "\(BeerQeeper.shared.thirdPositionCount)"
    }
    
    func closeDay() {
        BeerQeeper.shared.updateText()
        labelPurcaseCount.text = "Day information: \n\(BeerQeeper.shared.checkOutAll())"
        buttonCloseSceneOutlet.isEnabled = false
        buttonSellPurchasesOutlet.isEnabled = false
        buttonOpenSceneOutlet.setTitleColor(.red, for: .normal)
        firstBeerLabelCount.text = "\(BeerQeeper.shared.beerArray[0].quantity)"
        secondBeerLabelCount.text = "\(BeerQeeper.shared.beerArray[1].quantity)"
        thirdBeerLabelCount.text = "\(BeerQeeper.shared.beerArray[2].quantity)"
        firstNameOfBeerAvailiable.text = "\(BeerQeeper.shared.beerArray[0].mark)"
        secondNameOfBeerAvaliable.text = "\(BeerQeeper.shared.beerArray[1].mark)"
        thirdNameOfBeerAvailiable.text = "\(BeerQeeper.shared.beerArray[2].mark)"
        buttonSellPurchasesOutlet.backgroundColor = .lightGray
        buttonCloseSceneOutlet.setTitleColor(.lightGray, for: .normal)
        addOne.isEnabled = false
        addTwo.isEnabled = false
        addThree.isEnabled = false
        minusOne.isEnabled = false
        minusTwo.isEnabled = false
        minusThree.isEnabled = false
        buttonOpenSceneOutlet.isHidden = true
        view.addSubview(hiddenButton)
        hiddenButton.frame = CGRect(x: (Int(screen.width) - standartDimensionsX)/2, y: Int(thirdBeerLabelCount.frame.origin.y) + indent + standartFrameResultYeight + zeroPointY, width: standartDimensionsX, height: standartLabelHight)
        hiddenButton.isEnabled = true
        hiddenButton.isHidden = false
        hiddenButton.setTitle("Reset", for: .normal)
        hiddenButton.setTitleColor(.red, for: .normal)
        self.resetScene(sender: hiddenButton)
    }
    
    func resetDay(){
        BeerQeeper.shared.positionsCount = []
        BeerQeeper.shared.totalSalesForDay = []
        BeerQeeper.shared.totalSalesBottles = []
        BeerQeeper.shared.updateUI()
        BeerQeeper.shared.updateText()
        hiddenButton.isHidden = true
        buttonOpenSceneOutlet.isHidden = false
        firstBeerLabelCount.text = "\(BeerQeeper.shared.firstPositionCount)"
        secondBeerLabelCount.text = "\(BeerQeeper.shared.secondPositionCount)"
        thirdBeerLabelCount.text = "\(BeerQeeper.shared.thirdPositionCount)"
        self.secondStart()
    }
}
