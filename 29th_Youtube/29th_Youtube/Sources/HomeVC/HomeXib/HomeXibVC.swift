//
//  HomeXibVC.swift
//  29th_Youtube
//
//  Created by Yi Joon Choi on 2021/10/29.
//

import UIKit

class HomeXibVC: UIViewController {

    @IBOutlet weak var channelCV: UICollectionView!
    @IBOutlet weak var contentTV: UITableView!
    
    @IBOutlet weak var profileImg: UIImageView!
    
    var channelList: [ChannelData] = []
    var contentList: [ContentData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initChannelList()
        initContentList()
        registerXib()
        setUI()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func registerXib(){
        let channelCVXibName = UINib(nibName: ChannelCVC.identifier, bundle: nil)
        channelCV.register(channelCVXibName, forCellWithReuseIdentifier: ChannelCVC.identifier)
        
        let contentTVXibName = UINib(nibName: ContentTVC.identifier, bundle: nil)
        contentTV.register(contentTVXibName, forCellReuseIdentifier: ContentTVC.identifier)
    }
    
    func initChannelList(){
        channelList.append(contentsOf: [
            ChannelData(channelName: "Plan", channelIcon: "ggamju1"),
            ChannelData(channelName: "Design", channelIcon: "ggamju2"),
            ChannelData(channelName: "Android", channelIcon: "ggamju3"),
            ChannelData(channelName: "iOS", channelIcon: "ggamju4"),
            ChannelData(channelName: "Server", channelIcon: "ggamju5"),
            ChannelData(channelName: "Web", channelIcon: "ggamju6")
        ])
    }
    
    func initContentList(){
        contentList.append(contentsOf: [
            ContentData(contentTitle: "weSoptPlanPart", thumnbnail: "wesoptPlanPart", description: "WE SOPT : 조회수 100만회 : 3주 전"),
            ContentData(contentTitle: "weSoptDesignPart", thumnbnail: "wesoptDesignPart", description: "WE SOPT : 조회수 100만회 : 3주 전"),
            ContentData(contentTitle: "weSoptAndroidPart", thumnbnail: "wesoptAndroidPart", description: "WE SOPT : 조회수 100만회 : 3주 전"),
            ContentData(contentTitle: "weSoptiOSPart", thumnbnail: "wesoptiOSPart", description: "WE SOPT : 조회수 100만회 : 3주 전"),
            ContentData(contentTitle: "weSoptServerPart", thumnbnail: "wesoptServerPart", description: "WE SOPT : 조회수 100만회 : 3주 전"),
            ContentData(contentTitle: "weSoptWebPart", thumnbnail: "wesoptWebPart", description: "WE SOPT : 조회수 100만회 : 3주 전")
        ])
    }
    
    func setUI(){
        channelCV.dataSource = self
        channelCV.delegate = self
        contentTV.dataSource = self
        contentTV.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchToLogin))
        profileImg.addGestureRecognizer(tapGesture)
        profileImg.isUserInteractionEnabled = true
    }
    
    @objc func touchToLogin() {
        let nextVC = LoginVC()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension HomeXibVC: UICollectionViewDelegate{
    
}

extension HomeXibVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCVC.identifier, for: indexPath) as? ChannelCVC else {return UICollectionViewCell()}
        
        cell.setData(channelData: channelList[indexPath.row])
        return cell
    }
}

extension HomeXibVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeXibVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

extension HomeXibVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentTVC.identifier) as? ContentTVC else {return UITableViewCell()}
        
        cell.setData(contentData: contentList[indexPath.row])
        cell.presentToDetailViewController = {
            // 디테일로 이동
            let nextVC = DetailVC()
            nextVC.contentList = self.contentList[indexPath.row]
            nextVC.modalPresentationStyle = .overFullScreen
            self.present(nextVC, animated: true, completion: nil)
        }
        return cell
    }
}

