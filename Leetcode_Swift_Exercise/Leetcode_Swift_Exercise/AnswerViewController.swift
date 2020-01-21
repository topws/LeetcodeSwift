//
//  AnswerViewController.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/4/4.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		view.addSubview(textV)
		view.backgroundColor = UIColor.white
		textV.frame = view.bounds.inset(by: UIEdgeInsets.init(top: 80, left: 20, bottom: 20, right: 20))
		
		
    }
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let transform = SwitchNode()

        let result1 = transform.swapPairs(CreateListNodeByArray.createListNodeByArray(arr: [1,2,3,4]))
        print(result1)
	}
	open var exerciseText: String? {
		didSet {
			if let exerciseText = exerciseText {
				textV.text = exerciseText
			}
		}
	}
	
	private lazy var textV: UITextView = {
	
		let textV =  UITextView()
		textV.textColor = UIColor.black
		textV.textAlignment = .center
		textV.isScrollEnabled = true
		
		return textV
	}()
    

	

}
