//
//  CountOnMeCalculator.swift
//  Calculette-version1
//
//  Created by macmini-Armelle on 10/08/2020.
//  Copyright © 2020 armellelecerf. All rights reserved.
//

import Foundation
class CountOnMeCalculator {
   
    //MARK: properties
    var expression = ""
    var operationToReduce = [String]()
    var hasAResult = false
    var expressionToDisplay : String {return expression}
    var operationToReduceTest : [String]{return operationToReduce}
    var elements : [String]{return expression.split(separator : " ").map{"\($0)"}}

   //MARK: function RESET  //display a void screen
    
    func reset() {expression = " "}
    
   //MARK: other functions

}
