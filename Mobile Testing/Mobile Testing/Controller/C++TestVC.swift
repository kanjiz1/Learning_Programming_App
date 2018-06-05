//
//  C++TestVC.swift
//  Mobile Testing
//
//  Created by Oforkanji Odekpe on 6/5/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

struct Questions{
    var question: String!
    var answers: [String]!
    var answer: Int!
}

class C__TestVC: UIViewController {

    @IBOutlet var buttons: [RoundedButton]!
    @IBOutlet weak var qLabel: UILabel!
    
    var questions = [Questions]()
    var questionNumber = Int()
    var answerNumber = Int()
    var score: Float = 0
    var total: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questions = [Questions(question: "Choose the operator which cannot be overloaded.", answers:["/", "()","::","%"], answer: 2),
                     Questions(question: "Operators 'sizeof' and '?':", answers:["Both can be overloaded", "Both cannot be overloaded","Only sizeof can be overloaded", "Only ?: can be overloaded"], answer: 1),
                     Questions(question: "Which of the following correctly declares an array?", answers:["int array[10];", "int array;","array array[10];","array{10};"], answer: 0),
                     Questions(question: "which keyword is used to define the macros in c++?", answers:["macro", "#define","define","None of the above"], answer: 1),
                     Questions(question: " What does the following statement mean? \n int (*fp)(char*)", answers:["pointer to a pointer", "function taking a char* argument and returning a pointer to int","pointer to an array of chars","pointer to function taking a char* argument and returns an int"], answer: 3),
                     Questions(question: "The operator used for dereferencing or indirection is _", answers:["*", "->","->>","&"], answer: 0),
                     Questions(question: "Choose the right option: \n string* x, y;", answers:[" x is a pointer to a string, y is a string", "y is a pointer to a string, x is a string","both x and y are pointer to string types","None of the Above"], answer: 0),
                     Questions(question: "Which of the following is illegal?", answers:["int *ip;", "string s, *sp = 0;","int i; double* dp = &i;","int *pi = 0;"], answer: 2),
                     Questions(question: "Void pointer can point to which type of objects?", answers:["int", "double","char","All of the Above"], answer: 3),
                     Questions(question: "When does the void pointer become dereferenced?", answers:["when it doesn’t point to any value", "when it cast to another type of object","using delete keyword","None of the above"], answer: 1)]
        
        total = Float(questions.count)
        pickQuestion()
    }
    
    func pickQuestion(){
        if questions.count > 0{
            questionNumber = Int(arc4random()) % questions.count
            answerNumber = questions[questionNumber].answer
            qLabel.text = questions[questionNumber].question
            for i in 0..<buttons.count{
                buttons[i].setTitle(questions[questionNumber].answers[i], for: .normal)
            }
            questions.remove(at: questionNumber)
        } else{
            NSLog("Done!")
            let percentage = Float(100 * (score / total))
            
            if let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier :"ResultsVC") as? ResultVC{
                nextVC.result = "Final Results: \n \(percentage)%"
                self.present(nextVC, animated: true)
            } else{
                print("Error")
            }
        }
    }
    
    @IBAction func button1Pressed(_ sender: Any) {
        if answerNumber == 0{
            score += 1
            pickQuestion()
        } else{
            print("Wrong Answer")
            pickQuestion()
        }
    }
    
    @IBAction func button2Pressed(_ sender: Any) {
        if answerNumber == 1{
            score += 1
            pickQuestion()
        } else{
            print("Wrong Answer")
            pickQuestion()
        }
    }
    
    @IBAction func button3Pressed(_ sender: Any) {
        if answerNumber == 2{
            score += 1
            pickQuestion()
        } else{
            print("Wrong Answer")
            pickQuestion()
        }
    }
    
    @IBAction func button4Pressed(_ sender: Any) {
        if answerNumber == 3{
            score += 1
            pickQuestion()
        } else{
            print("Wrong Answer")
            pickQuestion()
        }
    }
}
