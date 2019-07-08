//
//  Views.swift
//  Tail2
//
//  Created by Rohan on 05/06/19.
//  Copyright © 2019 Infogain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // Checker
    var isClick  : Bool!
    
    // Global Data Instance
    let gldata = Balloon.sharedInstance;
    
    
    // Subview Instance
    var MainView : View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainView = View(frame: CGRect(x: gldata.X_coordinate, y: gldata.Y_coordinate, width: gldata.width, height: gldata.height))
        self.MainView.alpha = 0
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target:self,action:#selector(dismissView));
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap);
        isClick = false
    }
    
    
    // Second Global Instance
    // static let sharedInstance2 = BalloonMaker();
    @IBAction func onClick(_ sender: Any) {
        
        
        isClick = !isClick
        print(isClick);
        if isClick{
            
            //  self.MainView.balloon.alpha = 1.0
            view.addSubview(MainView)
            
            UIView.animate(withDuration: 0.7, delay: 0.20, options: .curveEaseIn, animations: {
                self.MainView.alpha = 1
            }, completion: { finished in
                // print("Basket doors opened!")
            })
            
        }else{
            self .dismissView()
            
        }
        
        
        
    }
    
    
    
    @objc func dismissView() {
        
        //  print("Entered Dissmiss View");
        
        
        UIView.animate(withDuration: 0.7,
                       delay: 0.20,
                       options: .curveEaseOut,
                       animations: {
                        self.MainView.alpha = 0.0
        }) { (_) in
            //    print("Removal");
            self.MainView.removeFromSuperview();
            self.isClick = false;
            
        }
        
        
    }
    
    
    
    
    
    
    
}

