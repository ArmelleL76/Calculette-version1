//
//  countOnMeCalculatorTest.swift
//  Calculette-version1Tests
//
//  Created by macmini-Armelle on 21/08/2020.
//  Copyright © 2020 armellelecerf. All rights reserved.
//

import XCTest



@testable import Calculette_version1

class CountOnMeCalculatorTestCase: XCTestCase {
    
    private var calculator: CountOnMeCalculator!
    func createExpression(nums: [String], opes: [String]){
     calculator.reset()
        // enumerated nous renvoie l'index et la valeur qui se trouve à cet index dans le tableau sur lequel elle est appelée
        for (index, num) in nums.enumerated() {
            // on ajoute le chiffre à l'expression
            calculator.addANumber(num)
            // si l'index du chiffre actuel est inferieur au nombre d'éléments dans opes
            if index < opes.count {
                // alors on ajoute l'opérateur
                calculator.addOperator(opes[index])
            }
        }
    }
    override func setUp() {
        super.setUp()
        calculator = CountOnMeCalculator()
        
    }
    
    func testGivenAnExpressionWithoutEqualSign_WhenCallingExpressionHasResult_ThenResultIsFalse() {
        //given
        calculator.expression = "4 + 5"
        //when
        let result = calculator.expressionHasResult(elements: calculator.elements)
        //then
        XCTAssertEqual(result, false)
    }
    
    func testGivenAnExpressionWithEqualSign_WhenCallingExpressionHasResult_ThenResultIsTrue() {
        //given
        calculator.expression = "7 - 5 ="
        //when
        let result = calculator.expressionHasResult(elements: calculator.elements)
        //then
        XCTAssertEqual(result, true)
    }
    func testGivenAnExpression_WhenCallingReset_ThenResultIsTrue() {
        calculator.expression = "5 + 7 - 9 / 2"
        calculator.reset()
        XCTAssertTrue(calculator.expression == " ")
    }
    func testGivenAnExpressionWithPlusAndDivide_whenCallingExpressionHasResut_ThenResultIsTrue(){
        calculator.expression = "6 - 18/3 ="
        let result = calculator.expressionHasResult(elements: calculator.elements)
        XCTAssertEqual(result, true)
    }
    
    func testGivenLastElementOperatorPlus_whenCallingExpressionIsCorrect_ThenResultIsFalse(){
        calculator.expression = "2 -3 +"
        let result = calculator.expressionIsCorrect(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    
    func testGivenLastElementOperatorMinus_whenCallingExpressionIsCorrect_ThenResultIsFalse(){
        calculator.expression = "4 + 5 -"
        let result = calculator.expressionIsCorrect(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    
    func testGivenLastElementOperatorDivide_whenCallingExpressionIsCorrect_ThenResultIsFalse(){
        calculator.expression = "7 - 3 /"
        let result = calculator.expressionIsCorrect(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    
    func testGivenLastElementOperatorMultiply_whenCallingExpressionIsCorrect_ThenResultIsFalse(){
        calculator.expression = "9 + 2 x"
        let result = calculator.expressionIsCorrect(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    func testGivenFirstElementOperatorPlus_whenCallingExpressionIsCorrect_ThenResultIsFalse(){
        calculator.expression = "+ 2 - 8 "
        let result = calculator.expressionIsCorrect(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    func testGivenFirstElementOperatorMinus_whenCallingExpressionIsCorrect_ThenResultIsTrue(){
        calculator.expression = "-4 + 5"
        let result = calculator.expressionIsCorrect(elements: calculator.elements)
        XCTAssertTrue(result)
    }
    
    func testGivenFirstElementOperatorDivide_whenCallingExpressionIsCorrect_ThenResultIsFalse(){
        calculator.expression = "/ 2 - 3 "
        let result = calculator.expressionIsCorrect(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    
    func testGivenFirstElementOperatorMultiply_whenCallingExpressionIsCorrect_ThenResultIsFalse(){
        calculator.expression = "x 9 + 2 "
        let result = calculator.expressionIsCorrect(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    
    func testGivenTwoElements_whenTestingExpressionHasEnoughElements_ThenResultIsFalse(){
        calculator.expression = "9 +"
        let result = calculator.expressionHasEnoughElement(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    func testGivenTreeElements_whenTestingExpressionHasEnoughElements_ThenResultIsTrue(){
        calculator.expression = "5 + 4"
        let result = calculator.expressionHasEnoughElement(elements: calculator.elements)
        XCTAssertTrue(result)
    }
    func testGivenLastElementOperande_whenTestingAddOperator_ThenResultIsTrue(){
        calculator.expression = "5 + 2  "
        let result = calculator.addOperator(calculator.expression)
        XCTAssertTrue(result)
    }
    func testGivenLastElementOperator_whenTestingAddOperator_ThenResultIsFalse(){
        calculator.expression = "4 - 7 / "
        let result = calculator.addOperator(calculator.expression)
        XCTAssertFalse(result)
    }
    
    func testGivenLastElementIsOperator_whenTestingAddOperator_ThenResultIsFalse(){
        calculator.expression = "8 x "
        let result = calculator.addOperator(calculator.expression)
        XCTAssertFalse(result)
    }
    
    func testGivenElementsWithEqual_whenTestingExpressionHasResult_ThenResultIsTrue(){
        calculator.expression = "2 + 3 x 4 ="
        let result = calculator.addOperator(calculator.expression)
        XCTAssertTrue(result)
    }
    
    func testGivenElementsWithEqualAndNothingElse_whenTestingExpressionHasResult_ThenResultIsTrue(){
        calculator.expression = " = "
        let result = calculator.addOperator(calculator.expression)
        XCTAssertTrue(result)
    }
    
    
    
    func testGivenElementsWithEqual_whenTestingExpressionHasResult_ThenResultIsFalse(){
        calculator.expression = "7 - 200 "
        let result = calculator.expressionHasResult(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    
    func testGivenLastElementsEqual0_whenTestingdividingIsPossible_ThenResultIsFalse(){
        calculator.expression = "78 + 4 / 0 "
        let result = calculator.dividingIsPossible(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    
    func testGivenLastElementsNonEqualZero_whenTestingdividingIsPossible_ThenResultIstrue(){
        calculator.expression = "213 - 4 / 9 "
        let result = calculator.dividingIsPossible(elements: calculator.elements)
        XCTAssertTrue(result)
    }
    func testGivenElementsOnePlusNine_whenTestingEqualFunc_ThenResultShouldBeTen()
    {
         createExpression(nums: ["1", "9"], opes: ["+"])
               let result = calculator.equalFunc(elements: calculator.elements)
                XCTAssertEqual(result, "10.0")
    }
    func testGivenElementsTreeMinusSeven_whenTestingEqualFunc_ThenResultShouldBeMinusFour()
    {    createExpression(nums: ["3", "7"], opes: ["-"])
        let result = calculator.equalFunc(elements: calculator.elements)
         XCTAssertEqual(result, "-4.0")
    }
    func testGivenElementsSeventeenDividedByTwo_whenTestingEqualFunc_ThenResultShouldBeEightPointFive()
    {   createExpression(nums: ["17", "2"], opes: ["/"])
    let result = calculator.equalFunc(elements: calculator.elements)
     XCTAssertEqual(result, "8.5")
       
    }
    func testGivenElementsNineMutipliedByZero_whenTestingEqualFunc_ThenResultShouldBeZero()
    {
        createExpression(nums: ["9", "0"], opes: ["x"])
           let result = calculator.equalFunc(elements: calculator.elements)
            XCTAssertEqual(result, "0.0")
        
    }
    func testGivenElementsNineMutipliedByTwoDividedByFive_whenTestingEqualFunc_ThenResultShouldBeTreePointSix()
    {
        createExpression(nums: ["9", "2", "5"], opes: ["x", "/"])
           let result = calculator.equalFunc(elements: calculator.elements)
            XCTAssertEqual(result, "3.6")
      
    }
    func testGivenElementsNinePlusTwoDividedByTwo_whenTestingEqualFunc_ThenResultShouldBeTen()
    {
        createExpression(nums: ["9", "2", "2"], opes: ["+", "/"])
           let result = calculator.equalFunc(elements: calculator.elements)
            XCTAssertEqual(result, "10.0")
       
    }
    func testGivenElementsSevenMinusThreeMultipliedByFour_whenTestingEqualFunc_ThenResultShouldBeMinusfive()
    {
        createExpression(nums: ["7", "3", "4"], opes: ["-", "x"])
           let result = calculator.equalFunc(elements: calculator.elements)
            XCTAssertEqual(result, "-5.0")
       
    }
    func testGivenElementsThousandPlustwoDividedByThree_whenTestingEqualFunc_ThenResultShouldBeThreeHundredThirtyFour()
        {
            createExpression(nums: ["0", "1002", "3"], opes: ["+", "/"])
               let result = calculator.equalFunc(elements: calculator.elements)
                XCTAssertEqual(result, "334.0")
            
        }
    }


