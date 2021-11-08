//
//  AwemeViewController.swift
//  Tools
//
//  Created by 范东 on 2021/11/7.
//

import UIKit
import FDNetwork
import AVKit

class AwemeViewController: BaseViewController {
    
    var dataArray = [AwemeModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "抖音用户视频"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBtnAction))
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        requestData()
    }
    
    func requestData(){
//    https://www.iesdouyin.com/web/api/v2/aweme/post/?sec_uid=MS4wLjABAAAAHmQ4DqHKN8IdfWWd52sYaGS6zaZaOTghOZ4ysZ0z_YM&count=21&max_cursor=1636359504000&aid=1128&_signature=QOtJJBARHVwzHUNLqlT-mEDrST&dytk=593d265a74e3384e06112b423ef268da
        FDNetwork.GET(url: "https://www.iesdouyin.com/web/api/v2/aweme/post/", param: ["sec_uid":"MS4wLjABAAAAHmQ4DqHKN8IdfWWd52sYaGS6zaZaOTghOZ4ysZ0z_YM","count":"21","max_cursor":"1615009429000","aid":"1128","_signature":"QOtJJBARHVwzHUNLqlT-mEDrST","dytk":"593d265a74e3384e06112b423ef268da"]) { result in
            self.dataArray.removeAll()
            let resultDict = result as! [String: Any]
            let aweme_list = resultDict["aweme_list"] as! [[String: Any]]
            for dict in aweme_list {
                let model = AwemeModel.deserialize(from: dict) ?? AwemeModel()
                self.dataArray.append(model)
            }
            self.collectionView.reloadData()
        } failure: { error in
            self.view.makeToast(error)
        }

    }
    

    @objc func addBtnAction(){
        let alert = UIAlertController(title:"请输入用户ID" , message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "用户ID"
        }
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { action in
            self.requestData()
        }))
        present(alert, animated: true, completion: nil)
    }

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LiveItemCell.classForCoder(), forCellWithReuseIdentifier: "LiveItemCell")
        return collectionView
    }()

}

extension AwemeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveItemCell", for: indexPath) as! LiveItemCell
        if indexPath.item < dataArray.count {
            cell.imageView.sd_setImage(with: URL(string: dataArray[indexPath.item].video.cover.url_list.first ?? ""), completed: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor((.screenW - 15 ) / 2)
        return CGSize(width:width , height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = dataArray[indexPath.item]
        let playerVC = AVPlayerViewController()
        let player = AVPlayer(url: URL(string: model.video.play_addr.url_list.first ?? "")!)
        playerVC.player = player
        player.play()
        present(playerVC, animated: true, completion: nil)
    }
}
