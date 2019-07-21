//
//  ViewController.swift
//  study005
//
//  Created by PeiYu Wang on 2019/7/20.
//  Copyright © 2019 PeiYu Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    //分区
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //数量
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        cell.backgroundColor=UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
        return cell
    }
   
    //设置每个item大小
    func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewFlowLayout,sizeForItemAt indexPath:IndexPath)->CGSize{
        if indexPath.row%2==0{
            return CGSize(width: 50, height: 50)
        }else{
            return CGSize(width: 100, height: 100)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()//流布局
        layout.scrollDirection = .vertical//竖直方向
        layout.minimumLineSpacing=10//最小行间距
        layout.minimumInteritemSpacing=0//最小列间距
        layout.itemSize=CGSize(width: self.view.frame.width/3-5, height: self.view.frame.width/3-5)//载体item大小
        let collectionView=UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor=UIColor.white
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "cellID")
        collectionView.delegate=self
        collectionView.dataSource=self
        self.view.addSubview(collectionView)
    }


}

