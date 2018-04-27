//
//  FormListSelectTableViewCell.swift
//  WufooPOC
//
//  Created by Jay Park on 4/26/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class FormListSelectTableViewCell: UITableViewCell, FormItemView {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //FormItemView conformance
    var delegate: FormItemViewDelegate?
    var formQuestion: FormQuestionModel! {
        didSet {
            self.configureView()
        }
    }
    var formItemOutputValue: String?
    {
//        return self.textView.text
        return nil
    }
    var mainInputControl: UIView {
        return self.tableView
    }
    
    var answerOptionCells = [UITableViewCell]()
    let rowHeight:CGFloat = 44.0

    override func awakeFromNib() {
        super.awakeFromNib()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.layer.borderColor = UIColor.black.cgColor
        self.tableView.layer.borderWidth = 5
    }
    
    func configureView() {
        self.questionLabel.text = self.formQuestion.questionName
        self.tableView.reloadData()
    }

}

extension FormListSelectTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.formQuestion.answerOptions.count)
        return self.formQuestion.answerOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.answerOptionCells.count > indexPath.row {
            return self.answerOptionCells[indexPath.row]
        }
        
        let questionAnswerChoiceString = self.formQuestion.answerOptions[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "stubReuseID")
        cell.textLabel?.text = questionAnswerChoiceString
        self.answerOptionCells.append(cell)
        
        return cell
    }
}
