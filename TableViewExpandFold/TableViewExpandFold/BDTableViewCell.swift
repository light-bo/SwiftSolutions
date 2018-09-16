//
//  BDTableViewCell.swift
//  SwiftPractise
//
//  Created by light_bo on 2018/9/15.
//  Copyright © 2018 light_bo. All rights reserved.
//

import UIKit

typealias BDCellBtnClickedAction = () -> ()

let kTableViewCellId = "BDTableViewCell"
class BDTableViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    func setUpViews() {
        infoLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        infoLabel.text = "This is the title, This is the title, This is the title, This is the title,"
        contentView.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(10)
        }
        
        infoTextView.text = "this is a very long long text, this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text,this is a very long long text end end end end end end"
//        infoTextView.text = "我是一个很长很长很长很长的文本，我是一个很长很长很长很长的文本，我是一个很长很长很长很长的文本，我是一个很长很长很长很长的文本，我是一个很长很长很长很长的文本，我是一个很长很长很长很长的文本，我是一个很长很长很长很长的文本，我是一个很长很长很长很长的文本，我是一个很长很长很长很长的文本，我是一个很长很长很长很长的文本。"
        
        contentView.addSubview(infoTextView)
        infoTextView.snp.makeConstraints { (make) in
            make.top.equalTo(infoLabel.snp.bottom).offset(5)
            make.left.equalTo(infoLabel.snp.left)
            make.right.equalTo(infoLabel.snp.right)
        }
        
        contentView.addSubview(expandBtn)
        expandBtn.isHidden = false
        expandBtn.snp.makeConstraints { (make) in
        make.top.equalTo(infoTextView.snp.firstBaseline).offset(infoTextView.font!.lineHeight-infoTextView.font!.descender)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        contentView.insertSubview(foldBtn, belowSubview: expandBtn)
        foldBtn.isHidden = true
        foldBtn.snp.makeConstraints { (make) in
            make.top.equalTo(infoTextView.snp.bottom).offset(5)
            make.left.right.equalTo(infoTextView)
            make.bottom.equalToSuperview()
            make.height.equalTo(25)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpData()  {
        //TO DO:update data, update fold status : 根据当前状态显示展开/折叠状态，避免 cell 重用时状态错乱
    }
    
    @objc func btnClick() {
        guard let unwrapedClickedAction = clickedAction else { return }
        
        unwrapedClickedAction()
        
        expandBtn.isHidden = !expandBtn.isHidden
        foldBtn.isHidden = !expandBtn.isHidden
        
        //record fold status...
    }
    
    var clickedAction: BDCellBtnClickedAction?
    
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.orange
        
        return label
    } ()
    
    lazy var infoTextView: UITextView = {
        let textView = UITextView(frame: CGRect())
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textColor = UIColor.black

        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    } ()
    
    lazy var expandBtn: UIButton = {
        let btn = UIButton(frame: CGRect())
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.backgroundColor = UIColor.yellow
        
        return btn
    } ()

    lazy var foldBtn: UIButton = {
        let btn = UIButton(frame: CGRect())
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.backgroundColor = UIColor.blue
        
        return btn
    } ()
}
