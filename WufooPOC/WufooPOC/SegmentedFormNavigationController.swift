//
//  SegmentedFormNavigationController.swift
//  WufooPOC
//
//  Created by Jay Park on 4/19/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class SegmentedFormNavigationController: UINavigationController {
    
    var formAnswers = [FormQuestionAnswer]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SegmentedFormNavigationController:SegmentedFormViewControllerDelegate {
    func segmentedFormViewController(_ segmentedFormViewController: SegmentedFormViewController, didAdvanceWithAnswers answers: [FormQuestionAnswer]) {
        self.formAnswers = self.formAnswers.filter({ (formQuestionAnswer) -> Bool in
            return !answers.contains(where: { (userQuestionAnswer) -> Bool in
                return userQuestionAnswer.wufooFieldID != formQuestionAnswer.wufooFieldID
            })
        })
        print("before \(self.formAnswers)")
        self.formAnswers.append(contentsOf: answers)
        print("after \(self.formAnswers)")
    }
}
