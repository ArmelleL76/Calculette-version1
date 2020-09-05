//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: - Properties
    
    let calculator = CountOnMeCalculator()
    
    // MARK: - ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    
    private func showMessage(_ message: String) {
        let alertVC = UIAlertController(title: "Erreur!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true)
    }
    
    private func addOperator(_ ope: String) {
        guard calculator.canAddOperator() else {
            return showMessage("Un operateur est déja mis ")
        }
        calculator.addOperator(ope)
        textView.text = calculator.expression
    }
    
    // MARK: - IBActions
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else { return }
        calculator.addANumber(numberText)
        textView.text = calculator.expression
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        addOperator("+")
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        addOperator("-")
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        addOperator("x")
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        addOperator("/")
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        calculator.reset()
        textView.text = calculator.expression
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculator.expressionHasEnoughElement(elements: calculator.elements) else {
            return showMessage("Votre expression est incomplète, démarrez un nouveau calcul!")
        }
        guard calculator.expressionIsCorrect(elements: calculator.elements) else {
            return  showMessage("Entrez une expression correcte!")
        }
        guard calculator.dividingIsPossible(elements: calculator.elements) else {
            return showMessage("La division par zéro est impossible!")
        }
        textView.text = calculator.equalFunc(elements: calculator.elements)
    }
}
