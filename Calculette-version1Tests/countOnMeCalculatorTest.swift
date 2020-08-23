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


    }

