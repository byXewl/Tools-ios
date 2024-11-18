//
//  InkePlayerViewController.swift
//  Tools
//
//  Created by Mac on 2021/8/30.
//

import UIKit
import FDUIKit

class InkePlayerViewController: BaseViewController {
        
    var data = InkeResponseModelData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initPlayer()
        view.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-CGFloat.safeAreaBottomHeight - 10)
            make.size.equalTo(CGSize(width: 44, height: 44))
        }
    }
    

    func initPlayer(){
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @objc func closeBtnAction(){
        dismiss(animated: true, completion: nil)
    }
    
    lazy var closeBtn: UIButton = {
        let closeBtn = UIButton(frame: .zero)
        closeBtn.addTarget(self, action: #selector(closeBtnAction), for: .touchUpInside)
        closeBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        return closeBtn
    }()

}
