//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 石川大輔 on 2021/02/26.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correct: String
    
    init(q: String, a: [String], correctAnswer: String){
    text = q
    answer = a
    correct = correctAnswer
    }
}
