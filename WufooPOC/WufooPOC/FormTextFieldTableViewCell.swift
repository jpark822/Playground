//
//  FormTextFieldTableViewCell.swift
//  WufooPOC
//
//  Created by Jay Park on 4/7/18.
//  Copyright © 2018 ThoughtSeize. All rights reserved.
//

import UIKit

class FormTextFieldTableViewCell: UITableViewCell, FormItemView {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var formQuestion: FormQuestionModel! {
        didSet {
            self.configureView()
        }
    }
    
    var mainInputControl: UIView {
        return self.textField
    }
    
    var formItemOutputValue: String? {
        return self.textField.text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func configureView() {
        self.questionLabel.text = self.formQuestion.questionName
    }

}
