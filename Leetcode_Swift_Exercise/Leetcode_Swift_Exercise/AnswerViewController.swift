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
		textV.frame = view.bounds.inset(by: UIEdgeInsets.init(top: 100, left: 20, bottom: 600, right: 20))
        
		
    }
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let c = DayFive()
        c.firstUniqChar("loveleetcode")
        
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
		textV.textColor = UIColor.white
		textV.textAlignment = .center
		textV.isScrollEnabled = true
        textV.backgroundColor = .black
		return textV
	}()
    

	

}
