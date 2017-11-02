//
//  ViewController.swift
//  dailidemo
//
//  Created by FC on 2017/11/2.
//  Copyright © 2017年 God bless never bug. All rights reserved.
//

//有待优化 代码抽取 简化代码 逻辑判断 有时间再搞吧。。。

import UIKit


class ViewController: UIViewController{
    
    
    lazy var topScrollview = UIScrollView()
    lazy var lineview = UIView()
    let titleArr = ["中国","美国","法国","英国","澳洲","北京","上海","南阳","官洲","南召","深圳"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.lightGray
        view.addSubview(addBtn(titleArray: titleArr))
    }
    
    
}
extension ViewController:UIScrollViewDelegate{
    fileprivate func addBtn(titleArray:[String]) -> UIScrollView {
        //        UIScrollview
        topScrollview=UIScrollView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 60))
        topScrollview.backgroundColor=UIColor.white
        topScrollview.contentSize=CGSize(width: 80 * titleArray.count+30, height: 0)
        topScrollview.backgroundColor=UIColor.lightGray
        topScrollview.delegate=self
        //    添加button到scrollview上
        for i in 0..<titleArray.count{
            let btn = UIButton(type: UIButtonType.custom)
            btn.setTitleColor(UIColor.darkGray, for: .normal)
            btn.setTitle(titleArray[i], for: .normal)
            btn.frame=CGRect(x: 81*i, y: 0, width: 80, height: 58)
            btn.backgroundColor=UIColor.white
            btn.addTarget(self, action: #selector(moveFollowbtn(_:)), for: .touchUpInside)
            btn.tag = 300 + i
            topScrollview.addSubview(btn)
        }
        //        添加底部线条
        lineview = UIView(frame: CGRect(x: 0, y: 58, width: 80, height: 2))
        lineview.backgroundColor=UIColor.red
        topScrollview.addSubview(lineview)
        return topScrollview
        
    }
    
    
    
}
var xxx = 0

//线条随按钮move
extension ViewController{
    @objc func moveFollowbtn(_ btn:UIButton) {
        
        //控制线条
        UIView.animate(withDuration: 0.2) {
            self.lineview.frame.origin.x = btn.frame.origin.x
        }
        
        let window = UIApplication.shared.delegate?.window
        let rect = btn.convert(btn.bounds, from: window!)
        print(-rect.origin.x)
        
        if (-rect.origin.x+130) >= view.bounds.width{
            xxx+=80
            let scrollContenOfSet = topScrollview.contentOffset.x + view.bounds.width + 80
            if (scrollContenOfSet >= topScrollview.contentSize.width){
                print(scrollContenOfSet,view.bounds.width,topScrollview.contentSize.width)
                return
            }
            UIView.animate(withDuration: 0.2, animations: {
                self.topScrollview.contentOffset=CGPoint(x: xxx, y: 0)
            })
        }
        if (-rect.origin.x)<=150{
            if topScrollview.contentOffset.x>=80{
                if (-rect.origin.x) <= 200{
                    xxx-=80
                    UIView.animate(withDuration: 0.2, animations: {
                        self.topScrollview.contentOffset=CGPoint(x: xxx, y: 0)
                    })
                }
            }
        }
        
    }
    
}









