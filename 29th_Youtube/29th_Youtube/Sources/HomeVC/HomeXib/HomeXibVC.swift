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
    
    var channelList: [ChannelData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initChannelList()
        registerXib()
        setUI()
    }
    
    func registerXib(){
        let xibName = UINib(nibName: ChannelCVC.identifier, bundle: nil)
        channelCV.register(xibName, forCellWithReuseIdentifier: ChannelCVC.identifier)
        
//        let xibName = UINib(nibName: contentTV.identifier, bundle: nil)
//        contentTV.register(xibName, forCellReuseIdentifier: .identifier)
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
    
    func setUI(){
        channelCV.dataSource = self
        channelCV.delegate = self
//        contentTV.dataSource = self
//        contentTV.delegate = self
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
