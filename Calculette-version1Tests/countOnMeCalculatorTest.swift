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
        let result = calculator.addOperator(elements: calculator.elements)
        XCTAssertTrue(result)
    }
    func testGivenLastElementOperator_whenTestingAddOperator_ThenResultIsFalse(){
        calculator.expression = "4 - 7 / "
        let result = calculator.addOperator(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    
    func testGivenLastElementIsOperator_whenTestingAddOperator_ThenResultIsFalse(){
        calculator.expression = "8 x "
        let result = calculator.addOperator(elements: calculator.elements)
        XCTAssertFalse(result)
    }
    
    func testGivenElementsWithEqual_whenTestingExpressionHasResult_ThenResultIsTrue(){
        calculator.expression = "2 + 3 x 4 ="
        let result = calculator.addOperator(elements: calculator.elements)
        XCTAssertTrue(result)
    }
    
    func testGivenElementsWithEqualAndNothingElse_whenTestingExpressionHasResult_ThenResultIsTrue(){
        calculator.expression = " = "
        let result = calculator.addOperator(elements: calculator.elements)
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
        XCTAssertEqual(calculator.equalFunc(elements : ["1", "+", "9"]), "10.0")
    }
    func testGivenElementsTreeMinusSeven_whenTestingEqualFunc_ThenResultShouldBeMinusFour()
    {
        XCTAssertEqual(calculator.equalFunc(elements : ["3", "-", "7"]), "-4.0")
    }
    func testGivenElementsSeventeenDividedByTwo_whenTestingEqualFunc_ThenResultShouldBeEightPointFive()
    {
        XCTAssertEqual(calculator.equalFunc(elements : ["17", "/", "2"]), "8.5")
    }
    func testGivenElementsNineMutipliedByZero_whenTestingEqualFunc_ThenResultShouldBeZero()
    {
        XCTAssertEqual(calculator.equalFunc(elements : ["9", "x", "0"]), "0.0")
    }
    func testGivenElementsNineMutipliedByTwoDividedByFive_whenTestingEqualFunc_ThenResultShouldBeTreePointSix()
    {
        XCTAssertEqual(calculator.equalFunc(elements : ["9", "x", "2", "/", "5"]), "3.6")
    }
    func testGivenElementsNinePlusTwoDividedByTwo_whenTestingEqualFunc_ThenResultShouldBeTen()
    {
        XCTAssertEqual(calculator.equalFunc(elements : ["9", "+", "2", "/", "2"]), "10.0")
    }
    func testGivenElementsSevenMinusTreeMultipliedByFour_whenTestingEqualFunc_ThenResultShouldBeMinusfive()
    {
        XCTAssertEqual(calculator.equalFunc(elements : ["7", "-", "3", "x", "4"]), "-5.0")
    }
}

