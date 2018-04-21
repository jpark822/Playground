//
//  SegmentedFormNavigationController.swift
//  WufooPOC
//
//  Created by Jay Park on 4/19/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class SegmentedFormNavigationController: UINavigationController {
    
    var segmentedFormModel:SegmentedFormModel! {
        didSet {
            guard segmentedFormModel != nil else {return}
            self.setupFormPages()
        }
    }
    var segmentedFormViewControllers = [SegmentedFormViewController]()
    
    var formAnswers = [FormQuestionAnswer]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchData()
    }
    
    func fetchData() {
        //call this earlier in the navigation controller's parent view controller
        NetworkManager.sharedInstace.getSegmentedForm { (segmentedFormModel, error) in
            if let segmentedFormModel = segmentedFormModel {
                self.segmentedFormModel = segmentedFormModel
            }
        }
    }
    
    func setupFormPages() {
        guard let formModel = self.segmentedFormModel else {
            return
        }
        self.popToRootViewController(animated: false)
        var allPageViewControllers = [SegmentedFormViewController]()
        for page in formModel.pages {
            let segmentedFormVC = UIStoryboard(name: "SegmentedForm", bundle: nil).instantiateViewController(withIdentifier: "SegmentedFormViewControllerId") as! SegmentedFormViewController
            segmentedFormVC.formPage = page
            segmentedFormVC.delegate = self
            allPageViewControllers.append(segmentedFormVC)
        }
        self.segmentedFormViewControllers = allPageViewControllers
        
        if let firstPage = self.segmentedFormViewControllers.first {
            self.viewControllers = [firstPage]
        }
    }
}



extension SegmentedFormNavigationController:SegmentedFormViewControllerDelegate {
    func segmentedFormViewController(_ segmentedFormViewController: SegmentedFormViewController, didAdvanceWithAnswers answers: [FormQuestionAnswer]) {
        
        let arrayOfExistingAnswerWufooIds:[String] = answers.map { (formQuestionAnswer) -> String in
            return formQuestionAnswer.wufooFieldID
        }
        let existingQuestionsWithAnswersRemoved = self.formAnswers.filter { (formQuestionAnswer) -> Bool in
            return !arrayOfExistingAnswerWufooIds.contains(formQuestionAnswer.wufooFieldID)
        }
        let newAnswers = existingQuestionsWithAnswersRemoved + answers
        self.formAnswers = newAnswers
        
        guard let index = self.segmentedFormViewControllers.index(where:  {$0 == segmentedFormViewController}) else {return}
        
        let nextIndex = index + 1
        if self.segmentedFormViewControllers.count > nextIndex {
            let nextPageVC = self.segmentedFormViewControllers[nextIndex]
            
            if self.segmentedFormViewControllers.count - 1 == nextIndex {
                nextPageVC.isLastPageInForm = true
            }
            self.pushViewController(nextPageVC, animated: true)
        }
        else {
            self.dismiss(animated: true)
            print("submit here")
        }
    }
}
