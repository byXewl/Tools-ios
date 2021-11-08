//
//  QRCodeGenerateViewController.swift
//  Tools
//
//  Created by Mac on 2021/4/20.
//

import UIKit

class QRCodeGenerateViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "二维码生成"
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(CGFloat.topHeight)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
        }
        scrollView.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(CGFloat.screenW - 30)
        }
        
        scrollView.addSubview(generateBtn)
        generateBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.width.equalTo(CGFloat.screenW - 30)
            make.top.equalTo(self.textView.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
        
    }
    
    @objc func generateBtnAction(){
        if textView.text.count == 0 {
            return
        }
        view.endEditing(true)
        let context = CIContext()
        let data = textView.text.data(using: .utf8)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 7, y: 7)
            if let output = filter.outputImage?.transformed(by: transform), let cgImage = context.createCGImage(output, from: output.extent) {
                let image = UIImage(cgImage: cgImage)
                if !scrollView.subviews.contains(imageView) {
                    scrollView.addSubview(imageView)
                    imageView.snp.makeConstraints { (make) in
                        make.left.right.equalTo(self.generateBtn);
                        make.top.equalTo(self.generateBtn.snp.bottom).offset(15)
                        make.height.equalTo(self.generateBtn.snp.width)
                    }
                    scrollView.addSubview(saveImageBtn)
                    saveImageBtn.snp.makeConstraints { (make) in
                        make.left.right.equalTo(self.generateBtn);
                        make.top.equalTo(self.imageView.snp.bottom).offset(15)
                        make.height.equalTo(40)
                    }
                }
                imageView.image = image
            }
        }
    }
    
    @objc func saveImageBtnAction(){
        saveImage(image: imageView.image ?? UIImage())
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkUIPasteboard()
        NotificationCenter.default.addObserver(self, selector: #selector(checkUIPasteboard), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func checkUIPasteboard(){
        let pasteboardStr = UIPasteboard.general.string
        if pasteboardStr?.count ?? 0 > 0 && pasteboardStr != textView.text {
            let alert = UIAlertController(title: "是否将剪贴板填入网址中", message: pasteboardStr, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { (action) in
                self.textView.text = pasteboardStr
            }))
            alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    lazy var textView : UITextView = {
        let textView = UITextView(frame: .zero)
        textView.layer.cornerRadius = 10
        textView.clipsToBounds = true
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.systemFill.cgColor
        textView.font = .systemFont(ofSize: 15)
        return textView
    }()
    
    lazy var generateBtn : UIButton = {
        let generateBtn = UIButton(frame: .zero)
        generateBtn.setTitle("生成", for: .normal)
        generateBtn.setTitleColor(.systemBlue, for: .normal)
        generateBtn.addTarget(self, action: #selector(generateBtnAction), for: .touchUpInside)
        generateBtn.layer.cornerRadius = 10
        generateBtn.clipsToBounds = true
        generateBtn.layer.borderWidth = 1
        generateBtn.layer.borderColor = UIColor.systemBlue.cgColor
        return generateBtn
    }()
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        return imageView
    }()
    
    lazy var saveImageBtn : UIButton = {
        let saveImageBtn = UIButton(frame: .zero)
        saveImageBtn.setTitle("保存", for: .normal)
        saveImageBtn.setTitleColor(.systemBlue, for: .normal)
        saveImageBtn.addTarget(self, action: #selector(saveImageBtnAction), for: .touchUpInside)
        saveImageBtn.layer.cornerRadius = 10
        saveImageBtn.clipsToBounds = true
        saveImageBtn.layer.borderWidth = 1
        saveImageBtn.layer.borderColor = UIColor.systemBlue.cgColor
        return saveImageBtn
    }()
    
    lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.contentSize = CGSize(width: 0, height: UIScreen.main.bounds.size.width - 30 + 40 + 80 + 40 + 3 * 15 + CGFloat.safeAreaBottomHeight)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -CGFloat.safeAreaBottomHeight, right: 0)
        return scrollView
    }()

}
