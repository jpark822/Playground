//
//  SegmentedFormViewController.swift
//  WufooPOC
//
//  Created by Jay Park on 4/18/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

protocol SegmentedFormViewControllerDelegate {
    func segmentedFormViewController(_ segmentedFormViewController:SegmentedFormViewController, didAdvanceWithAnswers answers:[FormQuestionAnswer])
}

class SegmentedFormViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var formQuestionCells = [UITableViewCell]()
    
    var delegate:SegmentedFormViewControllerDelegate?
    
    var formPage:SegmentedFormModel.Page!
    var questionModels:[FormQuestionModel] {
            return self.formPage.questions
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditingInTableView))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func endEditingInTableView() {
        self.view.endEditing(true)
    }

    @IBAction func nextPressed(_ sender: Any) {
        var index = 0
        var questionAnswers = [FormQuestionAnswer]()
        for cell in self.formQuestionCells {
            guard let castedCell = cell as? FormItemView,
            let formItemOutputValue = castedCell.formItemOutputValue else {
                continue
            }
            let questionItem = self.questionModels[index]
            
            let questionAnswer = FormQuestionAnswer(wufooFieldID: questionItem.id, userAnswer: formItemOutputValue)
            questionAnswers.append(questionAnswer)
            index += 1
        }
        
        if let delegate = self.delegate {
            delegate.segmentedFormViewController(self, didAdvanceWithAnswers: questionAnswers)
        }
    }
}

extension SegmentedFormViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.formQuestionCells.count > indexPath.row {
            return self.formQuestionCells[indexPath.row]
        }
        
        let questionModel = self.questionModels[indexPath.row]
        
        switch questionModel.questionType {
        case .textField:
            let textCell = Bundle.main.loadNibNamed("FormTextFieldTableViewCell", owner: self, options: [:])?.first as! FormTextFieldTableViewCell
            textCell.formQuestion = questionModel
            textCell.delegate = self
            self.formQuestionCells.append(textCell)
            return textCell
        case .phoneNumber:
            let phoneNumberTextCell = Bundle.main.loadNibNamed("FormTextFieldTableViewCell", owner: self, options: [:])?.first as! FormTextFieldTableViewCell
            phoneNumberTextCell.formQuestion = questionModel
            phoneNumberTextCell.inputType = .phoneNumber
            phoneNumberTextCell.delegate = self
            self.formQuestionCells.append(phoneNumberTextCell)
            return phoneNumberTextCell
        case .number:
            let numberCell = UITableViewCell(style: .default, reuseIdentifier: "questionCell")
            self.formQuestionCells.append(numberCell)
            numberCell.textLabel?.text = "number cell"
            return numberCell
        case .radio:
            let radioCell = Bundle.main.loadNibNamed("FormSegmentedControlTableViewCell", owner: self, options: [:])?.first as! FormSegmentedControlTableViewCell
            self.formQuestionCells.append(radioCell)
            radioCell.formQuestion = questionModel
            radioCell.delegate = self
            return radioCell
        case .select:
            let dropDownCell = Bundle.main.loadNibNamed("FormPickerTableViewCell", owner: self, options: [:])?.first as! FormPickerTableViewCell
            self.formQuestionCells.append(dropDownCell)
            dropDownCell.formQuestion = questionModel
            dropDownCell.delegate = self
            return dropDownCell
        case .textView:
            let textViewCell = Bundle.main.loadNibNamed("FormTextViewTableViewCell", owner: self, options: [:])?.first as! FormTextViewTableViewCell
            self.formQuestionCells.append(textViewCell)
            textViewCell.formQuestion = questionModel
            textViewCell.delegate = self
            return textViewCell
        case .unknown:
            let unknownCell = UITableViewCell(style: .default, reuseIdentifier: "questionCell")
            self.formQuestionCells.append(unknownCell)
            unknownCell.textLabel?.text = "unknown"
            return unknownCell
        }
    }
}

extension SegmentedFormViewController:FormItemViewDelegate {
    func formItemViewDidPressReturn(_ formItemView: FormItemView) {
        guard let castedFormCell = formItemView as? UITableViewCell else {
            return
        }
        guard let indexOfCell = self.formQuestionCells.index(of: castedFormCell) else {
            return
        }
        let nextIndex = indexOfCell + 1
        guard self.formQuestionCells.count > nextIndex else {
            return
        }
        guard let nextCellAsFormItem = self.formQuestionCells[nextIndex] as? FormItemView else {
            return
        }
        nextCellAsFormItem.mainInputControl.becomeFirstResponder()
    }
}