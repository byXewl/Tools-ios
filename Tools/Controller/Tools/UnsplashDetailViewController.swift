//
//  UnsplashDetailViewController.swift
//  Tools
//
//  Created by Mac on 2021/5/8.
//

import UIKit
import UnsplashPhotoPicker
import FDUIKit

class UnsplashDetailViewController: BaseViewController {
    
    var photo: UnsplashPhoto?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveBtnAction))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBtnAction))
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(CGFloat.navigationBarHeight + 15)
            make.height.equalTo(CGFloat.screenH - 200)
            make.width.equalTo(CGFloat.screenW)
        }
        view.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(self.imageView.snp.bottom).offset(15)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImageView.snp.right).offset(10)
            make.centerY.equalTo(self.iconImageView)
        }
        imageView.sd_setImage(with: photo?.urls[.raw]?.absoluteURL, completed: nil)
        iconImageView.sd_setImage(with: photo?.user.profileImage[.medium], completed: nil)
        nameLabel.text = photo?.user.name
    }
    
    @objc func cancelBtnAction(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func saveBtnAction(){
        saveImage(image: imageView.image ?? UIImage())
    }
    

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = 25
        return iconImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel(frame: .zero)
        return nameLabel
    }()

}
