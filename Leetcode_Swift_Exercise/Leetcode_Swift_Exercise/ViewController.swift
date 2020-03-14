//
//  ViewController.swift
//  Leetcode_Swift_Exercise
//
//  Created by Avazu Holding on 2019/4/4.
//  Copyright © 2019 Avazu Holding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - 数据源
	
	// 按照解题的 顺序，映射对应的代码, 例如，Sample第一个题目 对应 SimpleExeccise0
	let dataArr: [[String : [String]]] = [
		["simple" : ["给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。\n 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。\n示例:\n给定 nums = [2, 7, 11, 15], target = 9\n因为 nums[0] + nums[1] = 2 + 7 = 9\n所以返回 [0, 1]",
					 
			"给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。",
			
			"将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。之后，你的输出需要从左往右逐行读取，产生出一个新的字符串",
			
			"10块钱，买5瓶，4瓶盖兑换 1瓶，2个瓶子换 1瓶，初始有 10元",
			
			"编写一个函数来查找字符串数组中的最长公共前缀。如果不存在公共前缀，返回空字符串 \"\"。",
            
            "给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。有效字符串需满足：左括号必须用相同类型的右括号闭合。左括号必须以正确的顺序闭合。注意空字符串可被认为是有效字符串。",
            
            "1025. 除数博弈"
			
			]
		 
		 ],
		["middle" : ["请你来实现一个 atoi 函数，使其能将字符串转换成整数。",
					 
			"给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。",
			
			"罗马数字包含以下七种字符： I， V， X， L，C，D 和 M。",
			
			"给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。",
			
			"给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。",
			
			"给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。",
			
			"给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。（不重复）",
			
			"给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。",
            
            "将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。输入：1->2->4, 1->3->4,输出：1->1->2->3->4->4",
            
            "给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。例如，给出 n = 3，生成结果为：",
            
            "给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。"
			]
		],
        
        ["high" : ["合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。",
                   "给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。k 是一个正整数，它的值小于或等于链表的长度。如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。"]
        ]
	]
	
	// MARK: - viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		view.addSubview(tab)
		view.backgroundColor = UIColor.white

        
	}
	private lazy var tab: UITableView = {
		
		let tab = UITableView.init(frame: view.bounds, style: UITableView.Style.plain)
		tab.delegate = self
		tab.dataSource = self
		tab.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
		return tab
	}()

	
	
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return dataArr.count
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		let dict: Dictionary = dataArr[section]
		let value: [String] = dict.values.first ?? []
		
		return value.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") as! UITableViewCell
		let dict: Dictionary = dataArr[indexPath.section]
		let value: [String] = dict.values.first ?? []
		let key: String = dict.keys.first ?? "Null"
		if indexPath.row < value.count {
			let text: String = value[indexPath.row]
			cell.textLabel?.text = "(" + key + ")" + text
		}
		return cell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let dict: Dictionary = dataArr[indexPath.section]
		let value: [String] = dict.values.first ?? []
		
		if indexPath.row < value.count {
			let text: String = value[indexPath.row]
			let vc = AnswerViewController()
			vc.exerciseText = text
			self.navigationController?.pushViewController(vc, animated: true)
			tableView.deselectRow(at: indexPath, animated: true)
		}
	}
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 44// CGFloat.leastNormalMagnitude
	}
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return UIView(frame: CGRect(x: 0, y: 0, width: UIApplication.shared.keyWindow?.bounds.size.width ?? 375, height: 44))
	}
}
