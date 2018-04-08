//
//  FormTableViewController.swift
//  WufooPOC
//
//  Created by Jay Park on 4/7/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class FormTableViewController: UITableViewController {
    
    var questionModels = [FormQuestionModel]()
    var formQuestionCells = [UITableViewCell]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60
        
        AlamofireManager.sharedInstace.getFormAlamofire { (formQuestionModels, error) in
            if let error = error {
                print(error)
            }
            
            if let formQuestionModels = formQuestionModels {
                self.questionModels = formQuestionModels
                self.tableView.reloadData()
            }
        }
    }
}

//Datasource
extension FormTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.formQuestionCells.count > indexPath.row {
            return self.formQuestionCells[indexPath.row]
        }
        
        let questionModel = self.questionModels[indexPath.row]
        
        switch questionModel.questionType {
        case .text:
            let textCell = Bundle.main.loadNibNamed("FormTextFieldTableViewCell", owner: self, options: [:])?.first as! FormTextFieldTableViewCell
            textCell.formQuestion = questionModel
            self.formQuestionCells.append(textCell)
            return textCell
        case .number:
            let numberCell = UITableViewCell(style: .default, reuseIdentifier: "questionCell")
            self.formQuestionCells.append(numberCell)
            numberCell.textLabel?.text = "number cell"
            return numberCell
        case .radio:
            let radioCell = Bundle.main.loadNibNamed("FormSegmentedControlTableViewCell", owner: self, options: [:])?.first as! FormSegmentedControlTableViewCell
            self.formQuestionCells.append(radioCell)
            radioCell.formQuestion = questionModel
            return radioCell
        case .select:
            let dropDownCell = Bundle.main.loadNibNamed("FormPickerTableViewCell", owner: self, options: [:])?.first as! FormPickerTableViewCell
            self.formQuestionCells.append(dropDownCell)
            dropDownCell.formQuestion = questionModel
            return dropDownCell
        case .unknown:
            let unknownCell = UITableViewCell(style: .default, reuseIdentifier: "questionCell")
            self.formQuestionCells.append(unknownCell)
            unknownCell.textLabel?.text = "unknown"
            return unknownCell
        }
    }
    
}

