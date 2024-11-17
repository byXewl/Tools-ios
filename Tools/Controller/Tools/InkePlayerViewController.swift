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
    
    var playerContext: QPlayerContext?
    
    var myRenderView: QRenderView?

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
        let documentsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        playerContext = QPlayerContext(playerAPPVersion: "1.0.0", localStorageDir: documentsDir!, logLevel: .LOG_VERBOSE)
        myRenderView = QRenderView(frame: view.bounds)
        myRenderView!.attach(playerContext!)
        view.addSubview(myRenderView!)
        let modleBuilder = QMediaModelBuilder(isLive: true)
        modleBuilder.addStreamElement(userType: "", urlType: .QURL_TYPE_QAUDIO_AND_VIDEO, url: data.live_info.stream_addr, quality: 1080, isSelected: true, backupUrl: "", referer: "", renderType: .QPLAYER_RENDER_TYPE_PLANE)
        let model = modleBuilder.build()
        playerContext!.controlHandler.playMediaModel(pmediaModel: model, startPos: 0)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        playerContext?.controlHandler.playerRelease()
        playerContext = nil
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

//extension InkePlayerViewController: PLPlayerDelegate{
//
//}
