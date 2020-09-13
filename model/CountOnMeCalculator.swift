//
//  CountOnMeCalculator.swift
//  Calculette-version1
//
//  Created by macmini-Armelle on 10/08/2020.
//  Copyright © 2020 armellelecerf. All rights reserved.
//

import Foundation


class CountOnMeCalculator {
    
    // MARK: - Properties
    
    var expression = ""
    var elements: [String] { return expression.split(separator: " ").map { "\($0)" }}
    var hasAResult = false
    
    // MARK: - Methods
    
    func reset() { expression = " " }
    
    func expressionIsCorrect(elements: [String]) -> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "x"
            && elements.first != "+" && elements.last != "-" && elements.first != "/" && elements.first != "x"
    }
    
    func expressionHasEnoughElement(elements: [String]) -> Bool {
        return elements.count >= 3
    }
    
    func canAddOperator() -> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "x"
    }
    
    func addOperator(_ ope: String) {
        expression.append(" \(ope) ")
    }
    
    func addANumber(_ number: String) {
        expression += number
    }
    
    func expressionHasResult(elements: [String]) -> Bool {
        return elements.contains("=")
    }
    
    func dividingIsPossible( elements: [String]) -> Bool {
        for index in 1...elements.count {
            
        if elements[elements.count-index] == "0" && elements[elements.count-index-1] == "/" { return false }
        }
        return true
    }
    
    func equalFunc(elements: [String]) -> String? {
        var operationsToReduce: [String] = elements
        //        if the first index is a subtraction operator than it's a negative number so it
        //        merges the first and the second index
        if operationsToReduce[0] == "-" {
            operationsToReduce[0] = "\(operationsToReduce[0])\(operationsToReduce[1])"
            operationsToReduce.remove(at: 1)
        }
        
        while operationsToReduce.contains("x") || operationsToReduce.contains("/") {
            guard let result = calculatePriorities(operationsToReduce: operationsToReduce) else { return nil }
            operationsToReduce = result
        }
        
        while expressionHasEnoughElement(elements: operationsToReduce) {
            guard let result = calculateAdditionAndSubtraction(operationsToReduce: operationsToReduce) else { return nil }
            operationsToReduce = result
        }
        
        return operationsToReduce.first
    }
    
    private func calculateAdditionAndSubtraction(operationsToReduce: [String]) -> [String]? {
        var additionAndSubtraction: [String] = operationsToReduce
        
        guard let left: Double = Double(additionAndSubtraction[0]) else { return nil }
        guard let right: Double = Double(additionAndSubtraction[2]) else { return nil }
        
        let operand = additionAndSubtraction[1]
        let result: Double
        
        switch operand {
        case "+": result = left + right
        case "-": result = left - right
        default: return nil
        }
        
        additionAndSubtraction = Array(additionAndSubtraction.dropFirst(3))
        additionAndSubtraction.insert("\(result)", at: 0)
        
        return additionAndSubtraction
    }
    
    /// calculate the priorities when the calcul contains a division and\or a multiplication
    private func calculatePriorities(operationsToReduce: [String]) -> [String]? {
        var prioritiesCalculated: [String] = operationsToReduce
        
        guard let index = prioritiesCalculated.firstIndex(where: { $0 == "x" || $0 == "/" }) else { return nil }
        guard let left: Double = Double(prioritiesCalculated[index - 1]) else { return nil }
        guard let right: Double = Double(prioritiesCalculated[index + 1]) else { return nil }
        
        let operand = prioritiesCalculated[index]
        let result: Double
        
        switch operand {
        case "x": result = left * right
        case "/":
            if right == 0 {
                return nil
            } else {
                result = left / right
            }
        default: return nil
        }
        
        prioritiesCalculated[index - 1] = "\(result)"
        prioritiesCalculated.remove(at: index)
        prioritiesCalculated.remove(at: index)
        
        return prioritiesCalculated
    }
}
