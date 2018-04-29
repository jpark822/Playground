//
//  FormListSelectTableViewCell.swift
//  WufooPOC
//
//  Created by Jay Park on 4/27/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class FormListSelectTableViewCell: UITableViewCell, FormItemView {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var delegate: FormItemViewDelegate?
    var formQuestion: FormQuestionModel! {
        didSet {
            self.configureView()
        }
    }
    
    var formItemOutputValue: String?
    {
//        return self.textView.text
        return ""
    }
    
    var mainInputControl: UIView {
        return self.stackView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureView() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.questionLabel.text = self.formQuestion.questionName
        
        for answerChoice in self.formQuestion.answerOptions {
            let answerChoiceLabel = UILabel()
            answerChoiceLabel.text = answerChoice
            self.stackView.addArrangedSubview(answerChoiceLabel)
        }
    }
}
