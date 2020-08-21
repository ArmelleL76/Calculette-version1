//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -Outlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    let calculator = CountOnMeCalculator()
    
    
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        calculator.addANumber(numberText)
        textView.text = calculator.expression
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        //good way
        guard calculator.addOperator(elements : ["+"])
            else {
                textView.text.append(" + ")
                calculator.expression = textView.text
                
                return  }
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    //wrong way
    //      if calculator.canAddOperator(elements: elements) {
    //          textView.text.append(" + ")
    //      } else {
    //          let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
    //          alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    //          self.present(alertVC, animated: true, completion: nil)
    //      }
    
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        guard calculator.addOperator(elements: ["-"])
            
            else {
                textView.text.append(" - ")
                calculator.expression = textView.text
                
                return }
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        guard calculator.addOperator(elements: ["x"])
            else {
                textView.text.append(" x ")
                calculator.expression = textView.text
                
                return }
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        guard calculator.addOperator(elements: ["/"]) else {
            textView.text.append(" / ")
            calculator.expression = textView.text
            
            return }
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func resetButton(_sender : UIButton){
        calculator.reset()
        textView.text = calculator.expression
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculator.expressionIsCorrect(elements: calculator.elements) else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        guard calculator.expressionHasEnoughElement(elements: calculator.elements) else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Votre expression est incomplète, démarrez un nouveau //calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        guard calculator.dividingIsPossible(elements: calculator.elements) else {
            let alertVC = UIAlertController(title: "Zéro!", message: "La division par zéro est impossible!!!", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        textView.text = calculator.equalFunc(elements: calculator.elements)
    }
}
